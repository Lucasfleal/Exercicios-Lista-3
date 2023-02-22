#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex11()
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cCod   := '', cEstado := 'SP', cNome := ''
    Local cMsg   := ''
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SA2' MODULO 'COM'

    cQuery := 'SELECT A2_COD, A2_NOME ' + CRLF
    cQuery += 'FROM ' + RetSqlName('SA2') + ' SA2 ' + CRLF
    cQuery += "WHERE D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "AND  A2_EST = '" + cEstado + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod  := &(cAlias)->(A2_COD)
        cNome := &(cAlias)->(A2_NOME)
        cMsg += cCod + "--->" + cNome + CRLF
        cMsg += '------------------------------------------------------------' + CRLF

        &(cAlias)->(DbSkip())
    end

    FwAlertInfo(cMsg, 'Fornecedores do Estado de ' + cEstado)

    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
