#INCLUDE 'TOTVS.CH'

User Function L03Ex20()
    Local cTipo := M->B1_TIPO
    Local cZZGrupo := ''

    if cTipo == 'MP'
        cZZGrupo := 'Mat�ria Prima Produ��o'
    elseif cTipo == 'PA'
        cZZGrupo := 'Produtos para Comercializa��o'
    else
        cZZGrupo := 'Outros Produtos'
    endif

Return cZZGrupo
