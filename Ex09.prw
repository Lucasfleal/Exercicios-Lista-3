#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex09()
    Local cCod := FwInputBox("Digite o código do produto: ")
    Local cMsg := ""

    cMsg := BuscaPedidos(cCod)

    FwAlertInfo(cMsg, "Pedidos com o produto " + cCod)
    
Return

Static Function BuscaPedidos(cCod)
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cMsg   := ''
    Local cPedido := ''
    Local nCont  := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := 'SELECT C6_NUM' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC6') + ' SC6 ' + CRLF
    cQuery += "WHERE C6_PRODUTO = '" + cCod + " ' "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cPedido  := &(cAlias)->(C6_NUM)
        cMsg += cPedido + ', '
        nCont++

        &(cAlias)->(DbSkip())
    end

    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return cMsg
