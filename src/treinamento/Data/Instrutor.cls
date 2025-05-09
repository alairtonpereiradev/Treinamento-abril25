Class treinamento.Data.Instrutor Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String(MAXLEN = 200) [ SqlColumnNumber = 2 ];

Property Matricula As %String(MAXLEN = 20) [ SqlColumnNumber = 3 ];

Storage Default
{
<Data name="InstrutorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>Matricula</Value>
</Value>
</Data>
<DataLocation>^treinamento.Data.InstrutorD</DataLocation>
<DefaultData>InstrutorDefaultData</DefaultData>
<IdLocation>^treinamento.Data.InstrutorD</IdLocation>
<IndexLocation>^treinamento.Data.InstrutorI</IndexLocation>
<StreamLocation>^treinamento.Data.InstrutorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
