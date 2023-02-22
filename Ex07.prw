#INCLUDE 'TOTVS.CH'
#INCLUDE 'TOPCONN.CH'
#INCLUDE 'TBICONN.CH'

User Function L03Ex07()
    LOCAL cDataIni, cDataFim

    ObtemData(@cDataIni, @cDataFim)
    BuscaPedido(cDataIni, cDataFim)

Return

Static Function ObtemData(cDataIni, cDataFim)
    dDataIni := CTOD(FwInputBox("Informe a data inicial da pesquisa", ""))
    dDataFim := CTOD(FwInputBox("Informe a data final da pesquisa", ""))
    
    cDataIni := Dtos(dDataIni)
    cDataFim := Dtos(dDataFim)
Return

Static Function BuscaPedido(cDataIni, cDataFim)
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
    cQuery += "AND  C5_EMISSAO BETWEEN '" + cDataIni + "' AND '" + cDataFim + "'"

    TCQUERY cQuery ALIAS &(cAlias) NEW

    &(cAlias)->(DbGoTop())

    while &(cAlias)->(!EOF())
        cCod  := &(cAlias)->(C5_NUM)
        cMsg += 'Pedido : ' + cCod + CRLF
        nCont++

        &(cAlias)->(DbSkip())
    end

    if nCont > 0
        FwAlertInfo(cMsg, 'Pedidos No intervalo')
    endif
    &(cAlias)->(DbCloseArea())
  
    RestArea(aArea)
Return 
