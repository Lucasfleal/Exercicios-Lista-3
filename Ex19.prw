#INCLUDE 'PROTHEUS.CH'

user function L03Ex19()
    local cFrase := "", cTempChar := ""
    Local nA := 0, nE := 0, nI := 0, nO := 0, nU := 0, nEspaco := 0
    local nCont := 0

    cFrase := FwInputBox("Digite sua frase: ")

    for nCont := 1 to len(cFrase)
        cTempChar := upper(SUBSTR(cFrase, nCont, 1)) 

        if cTempChar == "A"
            nA++
        elseif cTempChar == "E"
            nE++
        elseif cTempChar == "I"
            nI++
        elseif cTempChar == "O"
            nO++
        elseif cTempChar == "U"
            nU++
        elseif ASC( cTempChar ) == 32
            nEspaco++
        endif
    next

    FwAlertInfo("Quantidade de espaços: " + CValToChar(nEspaco) + CRLF +;
                "Quantidade de A: " + CValToChar(nA) + CRLF +;
                "Quantidade de E: " + CValToChar(nE) + CRLF +;
                "Quantidade de I:  " + CValToChar(nI) + CRLF +;
                "Quantidade de O: " + CValToChar(nO) + CRLF +;
                "Quantidade de U: " + CValToChar(nU) + CRLF, "Contador")
return
