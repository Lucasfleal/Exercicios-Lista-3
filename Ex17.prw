#INCLUDE 'PROTHEUS.CH'

user function L03Ex17()
    local cNome := ""
    local cMsg := ""
    local nI := 0

    cNome := FwInputBox("Digite o seu nome: ")

    for nI := 1 to len(cNome)
        cMsg += upper(SUBSTR(cNome, nI, 1)) + CRLF
    next

    FwAlertInfo(cMsg, "Nome na vertical")
return
