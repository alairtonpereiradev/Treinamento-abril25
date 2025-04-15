Class treinamento.Data.Curso Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String(MAXLEN = 200) [ SqlColumnNumber = 2 ];

Property Matricula As %String(MAXLEN = 20) [ SqlColumnNumber = 3 ];

Property Idade As %Integer [ SqlColumnNumber = 4 ];

Property Telefone As %String(MAXLEN = 15) [ SqlColumnNumber = 5 ];

Storage Default
{
<Data name="CursoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>Matricula</Value>
</Value>
<Value name="4">
<Value>Idade</Value>
</Value>
<Value name="5">
<Value>Telefone</Value>
</Value>
</Data>
<DataLocation>^treinamento.Data.CursoD</DataLocation>
<DefaultData>CursoDefaultData</DefaultData>
<IdLocation>^treinamento.Data.CursoD</IdLocation>
<IndexLocation>^treinamento.Data.CursoI</IndexLocation>
<StreamLocation>^treinamento.Data.CursoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}