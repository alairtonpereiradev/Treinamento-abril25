Class treinamento.Data.Aluno Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String;

Storage Default
{
<Data name="AlunoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
</Data>
<DataLocation>^treinamento.Data.AlunoD</DataLocation>
<DefaultData>AlunoDefaultData</DefaultData>
<IdLocation>^treinamento.Data.AlunoD</IdLocation>
<IndexLocation>^treinamento.Data.AlunoI</IndexLocation>
<StreamLocation>^treinamento.Data.AlunoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
