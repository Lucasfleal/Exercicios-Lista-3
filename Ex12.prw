#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex12()
    Local cMsg := ""

    BuscaMenor(@cMsg)
    BuscaMaior(@cMsg)

    FwAlertInfo(cMsg, 'Produtos com maior e menor valor ')
Return

Static Function BuscaMaior(cMsg)
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cDesc   := '', cCod := '', nPrv := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_COD, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1 ' + CRLF
    cQuery += "WHERE  D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "ORDER BY B1_PRV1 DESC" 

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cDesc  := &(cAlias)->(B1_DESC)
    cCod  := &(cAlias)->(B1_COD)
    nPrv := &(cAlias)->(B1_PRV1)
    cMsg += "Produto com maior valor: " + cCod + "       " + cDesc  + "       " + CVALTOCHAR( nPrv ) + CRLF

    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return

Static Function BuscaMenor(cMsg)
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cDesc   := '', cCod := '', nPrv := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_COD, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1 ' + CRLF
    cQuery += "WHERE  D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "ORDER BY B1_PRV1" 

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    cDesc  := &(cAlias)->(B1_DESC)
    cCod  := &(cAlias)->(B1_COD)
    nPrv := &(cAlias)->(B1_PRV1)
    cMsg += "Produto com menor valor: " + cCod + "       " + cDesc  + "       " + CVALTOCHAR( nPrv ) + CRLF

    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
