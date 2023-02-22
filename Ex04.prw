#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex04()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cDesc   := ''
    Local cMsg   := ''
    Local cGrupo := 'G002'
    Local nCont  := 0
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_DESC' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1 ' + CRLF
    cQuery += "WHERE B1_GRUPO = '" + cGrupo + " ' "

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cDesc  := &(cAlias)->(B1_DESC)
        cMsg += "Produto: " + cDesc  + CRLF
        cMsg += '--------------------------------------------------------' + CRLF + CRLF
        nCont++

        if nCont == 10
            FwAlertInfo(cMsg, 'Grupo de Produtos ' + cGrupo)
            nCont := 0
            cMsg  := ''    
        endif

        &(cAlias)->(DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Grupo de Produtos ' + cGrupo)
    endif
    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
