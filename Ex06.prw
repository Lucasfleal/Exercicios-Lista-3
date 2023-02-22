#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex06()
    Local cCodInfo := FwInputBox("Digite o código para busca: ")

    BuscaCod(cCodInfo)
    
Return

Static Function BuscaCod(cCodInfo)
    Local aArea  := GetArea()
    Local cAlias := GetNextAlias()
    Local cQuery := ''
    Local cDesc   := '', cCod := '', cValUni := ''
    Local cMsg   := ''
    
    
    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' TABLES 'SB1' MODULO 'COM'

    cQuery := 'SELECT B1_COD, B1_DESC, B1_PRV1' + CRLF
    cQuery += 'FROM ' + RetSqlName('SB1') + ' SB1 ' + CRLF
    cQuery += "WHERE  D_E_L_E_T_ = ' ' " + CRLF
    cQuery += "AND B1_COD = '" + cCodInfo + "'"  

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cDesc  := &(cAlias)->(B1_DESC)
        cCod  := &(cAlias)->(B1_COD)
        cValUni := &(cAlias)->(B1_PRV1)
        cMsg += "Codigo: " + cCod + CRLF
        cMsg += "Descrição: " + cDesc  + CRLF
        cMsg += "Preço de Venda: R$" + CValToChar(cValUni) + "" 
        &(cAlias)->(DbSkip())
    end

    if ALLTRIM(cCod) == cCodInfo
        FwAlertInfo(cMsg, 'Produtos ')
    else
        FwAlertError("O código " + cCodInfo + " não consta no cadastro de produtos do sistema", "Código Inexistente")        
    endif
    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return
