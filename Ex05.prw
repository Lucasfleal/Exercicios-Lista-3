#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex05()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cDesc   := '', cCod := ''
    Local cMsg   := ''
    Local nCont  := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_COD, B1_DESC' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1 ' + CRLF
    cQuery += "WHERE  D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "ORDER BY B1_DESC DESC" 

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cDesc  := &(cAlias)->(B1_DESC)
        cCod  := &(cAlias)->(B1_COD)
        cMsg += cCod + "--->: " + cDesc  + CRLF
        cMsg += '--------------------------------------------------------' + CRLF
        nCont++

        if nCont == 10
            FwAlertInfo(cMsg, 'Produtos ')
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias)->(DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Produtos ')
    endif
    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
