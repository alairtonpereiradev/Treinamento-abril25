Class treinamento.Data.Turma Extends (%Persistent, %XML.Adaptor)
{

Property Instrutor As treinamento.Data.Instrutor [ SqlColumnNumber = 2 ];

Property DataInicio As %Date [ SqlColumnNumber = 3 ];

Property Status As %String [ SqlColumnNumber = 4 ];

Property Alunos As list Of treinamento.Data.Aluno [ SqlColumnNumber = 5 ];

Property Curso As treinamento.Data.Curso [ SqlColumnNumber = 6 ];

/// VerificaStatus
Method VerificaStatus(curso As %String) As %String [ Language = objectscript ]
{
    Set statusTurma = ""
    Set SQL = "Select * from treinamento_Data.Turma where Curso->Nome = '"_curso_"'"
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(SQL)
    If $SYSTEM.Status.IsError(status) Quit ""
    
    Set resultSet = statement.%Execute()
    If resultSet.%Next() {
        Set statusTurma = resultSet.%Get("Status")
    }
    
    Return statusTurma
}

ClassMethod ImprimeTurma(curso As %String) As %String [ Language = objectscript ]
{
    
    Set Status = $$$OK
    Set SQL = "Select * from treinamento_Data.Turma where Curso->Nome = '"_curso_"'"    
    Set statement = ##class(%SQL.Statement).%New()
    Set status = statement.%Prepare(SQL)
    If $SYSTEM.Status.IsError(status) Quit status
    
    Set resultSet = statement.%Execute()
    If resultSet.%Next() {
        Set idTurma = resultSet.%Get("ID")
        Set idTurma = resultSet.Get("ID")
        Set turma = ##class(treinamento.Data.Turma).%OpenId(idTurma)
    }
    For x= 1:1: turma.Alunos.Count()
    {
         Set aluno = turma.Alunos.GetAt(x)
         W "Nome : "_aluno.Nome, " Matricula : "_aluno.Matricula, " Idade :"_aluno.Idade, !
    }
    return
}

Storage Default
{
<Data name="TurmaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Instrutor</Value>
</Value>
<Value name="3">
<Value>DataInicio</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>Alunos</Value>
</Value>
<Value name="6">
<Value>Curso</Value>
</Value>
</Data>
<DataLocation>^treinamento.Data.TurmaD</DataLocation>
<DefaultData>TurmaDefaultData</DefaultData>
<IdLocation>^treinamento.Data.TurmaD</IdLocation>
<IndexLocation>^treinamento.Data.TurmaI</IndexLocation>
<StreamLocation>^treinamento.Data.TurmaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
