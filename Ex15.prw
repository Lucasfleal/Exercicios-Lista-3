#INCLUDE 'PROTHEUS.CH'

User Function L03Ex15()
    Local aDiasMes := {{1,"Janeiro",0}, {2,"Fevereiro",0}, {3,"Março",0}, {4,"Abril",0},{5,"Maio",0},{6,"Junho",0};
                        ,{7,"Julho",0},{8,"Agosto",0},{9,"Setembro",0},{10,"Outubro",0},{11,"Novembro",0},{12,"Dezembro",0}}
    Local nTempBusc := 0, nI, nMaior := 0, nMenor := 0, nTot := 0, cMaior := '', cMenor := ''

    for nI := 1 to 12
        nTempBusc := val(FwInputBox("Digite a temperatura média do mês de " + aDiasMes[nI,2] +": ", ""))
        aDiasMes[nI][3] := nTempBusc
    next

    for nI := 1 to 12
        nTempBusc := aDiasMes[nI][3]
        if nI == 1
            nTot := nMaior := nMenor := nTempBusc
            cMaior := aDiasMes[nI][2]
            cMenor := aDiasMes[nI][2]
        else
            if nTempBusc > nMaior
                nMaior := nTempBusc
                cMaior := aDiasMes[nI][2]
                nTot += nTempBusc
            elseif nTempBusc < nMenor
                nMenor := nTempBusc
                cMenor := aDiasMes[nI][2]
                nTot += nTempBusc
            else
                nTot += nTempBusc                        
            endif        
        endif
    next

    FwAlertInfo("Média anual: " + CValToChar(nTot/12) + " Graus" + CRLF; 
                + cMaior + ": " + CValToChar(nMaior) + " Graus" + CRLF;
                + cMenor + ": " + CValToChar(nMenor) + " Graus" + CRLF, "Media de temperatura")
Return 
