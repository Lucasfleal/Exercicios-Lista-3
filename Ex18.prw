#INCLUDE 'PROTHEUS.CH'

user function L03Ex18()
    local cNome := ""
    Local cConstNome := ""
    local cMsg := ""
    local nI := 0

    cNome := FwInputBox("Digite o seu nome: ")

    for nI := 1 to len(cNome)
        cConstNome += upper(SUBSTR(cNome, nI, 1)) 
        cMsg += cConstNome + CRLF
    next

    FwAlertInfo(cMsg, "Nome em escada")
return
