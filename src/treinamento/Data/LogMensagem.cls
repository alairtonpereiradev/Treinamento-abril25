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
        Set entry.Status        = statusCode
        set statusCode          = entry.%Save()

    }
    Catch(exception) {
        Set tSC = exception.AsStatus()
        Set erroMensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
    }
    return entry
}

ClassMethod Finalizar(pIdLog As %Integer, pStatusProcesso As %String, pstatusCode As %String) As treinamento.Data.LogMensagem
{
    Set tSC = $$$OK
    try {
        #Dim exception  As %Exception.General   = ""
        #Dim statusCode As %Status              = $SYSTEM.Status.OK()
        #Dim entry      As LogMensagem          = ..%OpenId(pIdLog)

        Set entry.Fim           = $ZDATETIME($H, 4)
        Set entry.StatusProcesso = pStatusProcesso
        Set entry.Status        = pstatusCode
        set statusLog          = entry.%Save()
    }
    Catch(exception) {
        Set tSC = exception.AsStatus()
        Set erroMensagem = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
    }
    return entry
}

ClassMethod ConsultaLog(pStatus As %Boolean, pDataInicio As %String, pDataFim As %String) As treinamento.Data.VO.LogMensagem
{
   
    try 
    {   
        #Dim StatusCode   As %Status            = $SYSTEM.Status.OK()
        #Dim exception    As %Exception.General = ""
        #Dim SQL          As %String
        #Dim statement    As %SQL.Statement
        #Dim resultSet    As %SQL.StatementResult
        #Dim entry        AS LogMensagem        = ..%New()

        Set SQL = "SELECT * FROM treinamento_Data.LogMensagem WHERE Status = ? AND FIM <= ?"
        Set statement = ##class(%SQL.Statement).%New()
        Set statusCode = statement.%Prepare(SQL)
        If $System.Status.Error(statusCode) Return statusCode

        Set resultSet = statement.%Execute(pStatus, pDataFim)
        While (resultSet.%Next())
        {
            Set pItem = ##class(treinamento.Data.VO.LogMensagem).%New()
            Set pItem.Metodo          = resultSet.%Get("Metodo")     
            Set pItem.Classe          = resultSet.%Get("Classe")
            Set pItem.Inicio          = resultSet.%Get("Inicio")     
            Set pItem.Fim             = resultSet.%Get("Fim")
            Set pItem.Status          = resultSet.%Get("Status")     
            Set pItem.StatusProcesso  = resultSet.%Get("StatusProcesso")
            Do entry.ListaLog.Insert(pItem)
        }
      

    }
    Catch(exception)
    {
        Set tSC           = exception.AsStatus()
        Set erroMensagem  = $SYSTEM.Status.GetOneErrorText(tSC)
        Throw exception
        
    }
    return entry
}

ClassMethod ConsultaLogBasico(pStatus As %Boolean, pDataInicio As %String = "", pDataFim As %String) As treinamento.Data.VO.LogMensagem
{
   
    #Dim LogMensagem  AS LogMensagem = ..%New()
    Set LogMensagem = ..ConsultaLog(pStatus,pDataInicio,pDataFim)
    W "A quantidade de logs encontrado foi ... : "_LogMensagem.ListaLog.Count()
}

ClassMethod ConsultaLogPaginacao(pStatus As %Boolean, pLastId As %Integer, pPageSize As %Integer, pDataFim As %String) As treinamento.Data.VO.LogMensagem
{
   
        try 
        {   
            Set tSC = $$$OK
            Set SQL  = "SELECT TOP " _ pPageSize _ " * FROM treinamento_Data.LogMensagem "
            Set SQL = SQL_"WHERE Status = "_pStatus 
            Set SQL = SQL_ " AND Fim <= '"_pDataFim_"'"
            Set SQL = SQL_ "AND ID > "_pLastId

            Set statement = ##class(%SQL.Statement).%New()
            Set tSC = statement.%Prepare(SQL)
            If $System.Status.Error(tSC) Throw tSC
            Set resultSet = statement.%Execute()
            Set count = 0 
                While(resultSet.%Next())
                {
                    Set count = count +1
                    Write " ID : ", resultSet.%Get("ID") , " | Metodo : ", resultSet.%Get("Metodo"), " | Classe : ", resultSet.%Get("Classe"), "| Inicio : " , resultSet.%Get("Inicio"), !
                    Write "Fim : ", resultSet.%Get("Fim"), "| Status : ", resultSet.%Get("Status"), "| StatusProcesso : ", resultSet.%Get("StatusProcesso") , ! 
                }
                If count > 0
                {
                    W "Total de log encontrados por pagina ", count, ! 
                }
                Else
                {
                W "Nenhum   log encontrados para essa pesquisa"
                }

        }
        Catch(exception)
        {
            Set tSC           = exception.AsStatus()
            Set erroMensagem  = $SYSTEM.Status.GetOneErrorText(tSC)
            Throw exception
            
        }
    Quit
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
