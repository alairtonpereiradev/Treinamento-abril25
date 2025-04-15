Class treinamento.Data.Curso Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String(MAXLEN = 200) [ SqlColumnNumber = 2 ];

Property Preco As %Numeric [ SqlColumnNumber = 3 ];

Property Duracao As %Integer [ SqlColumnNumber = 4 ];

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
<Value>Preco</Value>
</Value>
<Value name="4">
<Value>Duracao</Value>
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
