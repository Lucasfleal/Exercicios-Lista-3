#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex10()
    Local cCod := FwInputBox("Digite o código do produto: ")
    Local nTotVen := 0, nCont  := 0

    nTotVen := BuscaPedidos(cCod, @nCont)

    FwAlertInfo("Foram vendidos " + CVALTOCHAR( nTotVen ) + " unidades do produto em " + CVALTOCHAR(nCont) + " Pedidos" + CRLF + CRLF +;
                "A média é de " + alltrim(str(nTotVen/nCont, , 2)), "Media de vendas do produto por pedido" + cCod)
    
Return

Static Function BuscaPedidos(cCod, nCont)
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local nQtdVen := 0, nTotVen := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := 'SELECT C6_QTDVEN' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC6') + ' SC6 ' + CRLF
    cQuery += "WHERE C6_PRODUTO = '" + cCod + " ' "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        nQtdVen  := &(cAlias)->(C6_QTDVEN)
        nTotVen += nQtdVen
        nCont++

        &(cAlias)->(DbSkip())
    end

    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return nTotVen
