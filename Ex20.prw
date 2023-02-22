#INCLUDE 'TOTVS.CH'

User Function L03Ex20()
    Local cTipo := M->B1_TIPO
    Local cZZGrupo := ''

    if cTipo == 'MP'
        cZZGrupo := 'Matéria Prima Produção'
    elseif cTipo == 'PA'
        cZZGrupo := 'Produtos para Comercialização'
    else
        cZZGrupo := 'Outros Produtos'
    endif

Return cZZGrupo
