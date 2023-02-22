#INCLUDE 'PROTHEUS.CH'

User Function L03Ex14()
    Local aNumSoma := {}
    Local nI, nNum := 0, cMsg := ''
    for nI := 1 to 5
        nNum := val(FwInputBox("Digite o " + CVALTOCHAR( nI ) + "º valor: ", "" ))
        AADD( aNumSoma, nNum )
    next

    for nI := 1 to 5
        cMsg += CVALTOCHAR( aNumSoma[nI] )
    next

    FwAlertInfo(cMsg, "Numeros em forma de string")

Return 
