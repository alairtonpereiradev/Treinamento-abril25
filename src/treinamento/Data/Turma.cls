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
   
    Set tSC = $$$OK
    Set core = ##class(treinamento.Data.LogMensagem).%New()
    Try 
        {   
            #; Processo de Criação de Log
            Set StatusProcesso = "Metodo VerificaStatus executado com sucesso"
            Set pStatus = 1
            Set init = core.CriarEntrada("VerificaStatus", "treinamento.Data.Turma")
            Set IdLog = init.%Id()

            Set statusTurma = ""
            Set SQL = "Select * from treinamento_Data.Turma where Curso->Nome = '"_curso_"'"
            Set statement = ##class(%SQL.Statement).%New()
            Set status = statement.%Prepare(SQL)
            If $SYSTEM.Status.IsError(status) return status   
            Set resultSet = statement.%Execute()
    
            If statement.%Next() {
                Set statusTurma = statement.%Get("Status")
            }
        }
        Catch (exception)
        {
            Set tSC             = exception.AsStatus()
            Set pStatus         = 0
            Set erroMensagem    = $SYSTEM.Status.GetOneErrorText(tSC)
            Set erro            = "IdLog :"_IdLog_" - ErroLog : "_erroMensagem
            Set Fim             = core.Finalizar(IdLog, erro,  pStatus)            
            Throw exception
        }
        Set fim = core.Finalizar(IdLog, StatusProcesso, pStatus)
        Return statusTurma
}

ClassMethod ImprimeTurma(curso As %String) As %String [ Language = objectscript ]
{
   
    Set tSC = $$$OK
    Set core = ##class(treinamento.Data.LogMensagem).%New()
    Try 
    {   
        Set StatusProcesso = "Metodo ImprimeTurma executado com sucesso"
        Set pStatus = 1
        Set init = core.CriarEntrada("ImprimeTurma", "treinamento.Data.Turma")
        Set IdLog = init.%Id()

        Set Status = $$$OK
        Set SQL = "Select * from treinamento_Data.Turma where Curso->Nome = '"_curso_"'"    
        Set statement = ##class(%SQL.Statement).%New()
            
        Set status = statement.%Prepare(SQL)
        If $SYSTEM.Status.IsError(Status) return Status
        
        Set Status = statement.%Execute()
        If $SYSTEM.Status.IsError(Status) return Status

        If statement.%Next() {
            Set idTurma = statement.%Get("ID")
            ;Set idTurma = statement.Get("ID")
            Set turma = ##class(treinamento.Data.Turma).%OpenId(idTurma)
        }
    
        For x= 1:1: turma.Alunos.Count()
        {
         Set aluno = turma.Alunos.GetAt(x)
         Write "Nome : "_aluno.Nome, " Matricula : "_aluno.Matricula, " Idade :"_aluno.Idade, ! 
        }
    }
    Catch exception
    {
        Set tSC             = exception.AsStatus()
        Set pStatus         = 0
        Set erroMensagem    = $SYSTEM.Status.GetOneErrorText(tSC)
        Set erro            = "IdLog :"_IdLog_" - ErroLog : "_erroMensagem
        Set Fim             = core.Finalizar(IdLog, erro,  pStatus)            
        Throw exception
    }
    Set fim = core.Finalizar(IdLog, StatusProcesso, pStatus)
    Return
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
