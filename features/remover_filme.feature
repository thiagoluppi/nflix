#language:pt

@login
Funcionalidade: Remover filme
    Para que eu possa manter o catalogo atualizado
    Sendo um gestor de catalogo que encontrou um titulo cancelado/indesejado 
    Posso remover este item

    @rm_movie
    Cenario: Confirmar exclusao
        Dado que "dbz" esta no catalogo
        Quando eu solicito a exclusao
        E eu confirmo a solicitacao
        Então este item deve ser removido do catalogo
    
    @dont_remove
    Cenario: Cancelar exclusao
        Dado que "dez_coisas" esta no catalogo
        Quando eu solicito a exclusao
        Mas cancelo a solicitacao
        Então este item deve permanecer no catalogo
