#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex03()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cCod   := '', cDesc := '', cValUni := '', cValTot := '', cQtd := ''
    Local cMsg   := ''
    Local cPedido := 'PV0008'
    Local nCont  := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := 'SELECT C6_PRODUTO,  C6_DESCRI, C6_QTDVEN, C6_PRCVEN, C6_VALOR' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC6') + ' SC6 ' + CRLF
    cQuery += "WHERE C6_NUM = '" + cPedido + " ' " + CRLF

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod  := &(cAlias)->(C6_PRODUTO)
        cDesc  := &(cAlias)->(C6_DESCRI)
        cQtd  := &(cAlias)->(C6_QTDVEN)
        cValUni  := &(cAlias)->(C6_PRCVEN)
        cValTot  := &(cAlias)->(C6_VALOR)
        cMsg += cCod + ' - ' + cDesc + ' - ' + CVALTOCHAR(cQtd) + ' - ' + CVALTOCHAR(cValUni) + ' - ' + CVALTOCHAR(cValTot) + CRLF
        cMsg += '--------------------------------------' + CRLF + CRLF
        nCont++

        if nCont == 10
            FwAlertInfo(cMsg, 'Dados do Pedido')
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias)->(DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Dados dos Pedido')
    endif
    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
