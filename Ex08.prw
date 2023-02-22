#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex08()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cDesc   := '', cCod := '', nPrv := 0, nTotVen := 0, cMsg := ""
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SC6' MODULO 'FAT'

    cQuery := 'SELECT C6_PRODUTO, C6_DESCRI, C6_PRCVEN, C6_VALOR' + CRLF
    cQuery += 'FROM ' + RetSqlName('SC6') + ' SC6 ' + CRLF
    cQuery += "WHERE  D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "ORDER BY C6_VALOR DESC" 

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cDesc  := &(cAlias)->(C6_DESCRI)
    cCod  := &(cAlias)->(C6_PRODUTO)
    nPrv := &(cAlias)->(C6_PRCVEN)
    nTotVen := &(cAlias)->(C6_VALOR)
    cMsg += "Código: " + CVALTOCHAR(cCod) + CRLF +;
            "Descrição: " + cDesc  + CRLF +;
            "Valor Unitário: "+ CVALTOCHAR( nPrv ) + CRLF +;
            "Valor Total: "+ CVALTOCHAR( nTotVen ) + CRLF

    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)

    FwAlertInfo(cMsg, 'Produto com maior valor total de venda ')
Return
