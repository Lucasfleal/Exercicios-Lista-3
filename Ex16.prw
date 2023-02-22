#INCLUDE 'PROTHEUS.CH'

user function L03Ex16()
    local cNome := ""
    local cNomeInvertido := ""
    local nI := 0

    cNome := FwInputBox("Digite o seu nome: ")

    for nI := len(cNome) to 1 step -1
        cNomeInvertido += upper(SUBSTR(cNome, nI, 1))
    next

    FwAlertInfo("Seu nome de trás para frente é " + cNomeInvertido, "Nome ao Invertido")
return
