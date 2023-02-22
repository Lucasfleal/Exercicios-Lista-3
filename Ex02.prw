#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex02()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cCod   := ''
    Local cMsg   := ''
    Local nCont  := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC5' MODULO 'FAT'

    cQuery := 'SELECT C5_NUM ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC5') + ' SC5 ' + CRLF
    cQuery += "WHERE D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "AND  C5_NOTA = ''"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod  := &(cAlias)->(C5_NUM)
        cMsg += 'Pedido : ' + cCod + CRLF
        cMsg += '------------------------------' + CRLF + CRLF
        nCont++

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
