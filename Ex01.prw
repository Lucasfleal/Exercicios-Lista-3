#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex01()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cFornecedor := 'F00004'
    Local cQuery := ''
    Local cCod   := ''
    Local cMsg   := ''
    Local nCont  := 0, nQtdP := 1
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC7' MODULO 'COM'

    cQuery := 'SELECT C7_NUM ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC7') + ' SC7 ' + CRLF
    cQuery += "WHERE D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "AND  C7_FORNECE = '" + cFornecedor + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod  := &(cAlias)->(C7_NUM)
        cMsg += 'Pedido ' + CVALTOCHAR( nQtdP ) + ': ' + cCod + CRLF
        cMsg += '------------------------------' + CRLF + CRLF
        nCont++
        nQtdP++

        if nCont == 10
            FwAlertInfo(cMsg, 'Dados dos Pedidos')
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias)->(DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Pedidos')
    endif
    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
