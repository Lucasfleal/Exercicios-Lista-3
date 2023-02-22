#INCLUDE 'PROTHEUS.CH'

User Function L03Ex13()
    Local aDiasMes := {{1,"Janeiro"}, {2,"Fevereiro"}, {3,"Março"}, {4,"Abril"},{5,"Maio"},{6,"Junho"};
                        ,{7,"Julho"},{8,"Agosto"},{9,"Setembro"},{10,"Outubro"},{11,"Novembro"},{12,"Dezembro"}}
    Local cTempBusc := '', nTempBusc := 0

    cTempBusc := FwInputBox("Digite um mês para saber qual é: ", "")
    nTempBusc := Val(cTempBusc)
    
    if ISDIGIT( cTempBusc ) 
        if nTempBusc > 0 .and. nTempBusc <= 12
            FwAlertInfo("Esse é o mês de " + aDiasMes[nTempBusc,2])
        else
            FwAlertError("Precisa ser informado um valor de 1 a 12") 
        endif
        
    else
        FwAlertError("Precisa ser informado um valor de 1 a 12")        
    endif

Return 
