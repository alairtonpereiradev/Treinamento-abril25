Class treinamento.Data.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String [ SqlColumnNumber = 2 ];

Property Classe As %String [ SqlColumnNumber = 3 ];

Property Inicio As %String [ SqlColumnNumber = 4 ];

Property Fim As %String(MAXLEN = 200) [ SqlColumnNumber = 5 ];

Property Status As %Boolean [ SqlColumnNumber = 6 ];

Property StatusProcesso As %String [ SqlColumnNumber = 7 ];

Property ListaLog As list Of treinamento.Data.VO.LogMensagem;

ClassMethod CriarEntrada(pMetodo As %String, pClasse As %String) As treinamento.Data.LogMensagem
{

    Set tSC = $$$OK
    try {
        #Dim exception  As %Exception.General   = ""
        #Dim statusCode As %Status              = $SYSTEM.Status.OK()
        #Dim entry      As LogMensagem          = ..%New()

        Set entry.Metodo        = pMetodo
        Set entry.Classe        = pClasse
        Set entry.Inicio        = $ZDATETIME($H, 4)
        Set entry.Fim           = ""
        Set entry.status        = statusCode
        set statusCode          = entry.%Save()
        ;if($SYSTEM.Status.IsError(statusCode)) {
        ;    Set tSC = statusCode
        ;    Quit tSC
        ;}
        ;Set entry.StatusProcesso = "Iniciado"

    }
    Catch(exception) {
        Set tSC = exception.AsStatus()
        Set erromensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        ;Write "Erro: "_erromensagem
        ;Quit tSC
        Throw exception
    }
    return entry
}

Storage Default
{
<Data name="LogMensagemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Metodo</Value>
</Value>
<Value name="3">
<Value>Classe</Value>
</Value>
<Value name="4">
<Value>Inicio</Value>
</Value>
<Value name="5">
<Value>Fim</Value>
</Value>
<Value name="6">
<Value>Status</Value>
</Value>
<Value name="7">
<Value>StatusProcesso</Value>
</Value>
<Value name="8">
<Value>ListaLog</Value>
</Value>
</Data>
<DataLocation>^treinamento.Data.LogMensagemD</DataLocation>
<DefaultData>LogMensagemDefaultData</DefaultData>
<IdLocation>^treinamento.Data.LogMensagemD</IdLocation>
<IndexLocation>^treinamento.Data.LogMensagemI</IndexLocation>
<StreamLocation>^treinamento.Data.LogMensagemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
