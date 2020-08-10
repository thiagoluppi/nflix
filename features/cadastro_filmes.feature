#language:pt

@login
Funcionalidade: Cadastro de filmes
  Para que eu possa disponibilizar novos títulos no catálogo
  Sendo um gestor de catálogo
  Posso cadastrar um novo filmes

  @novo_filme
  Esquema do Cenario: Novo filme

    Dado que <codigo> é um novo filme
    Quando eu faço o cadastro deste filme
    Então devo ver o novo filme na lista

    Exemplos:
      | codigo     |
      | "ultimato" |
      | "spider"   |
      | "joker"    |

  @attempt_movie
  Esquema do Cenario: Campos obrigatórios
    O gestor de catálogo tenta cadastrar um novo filme, mas esquece
    de preencher um dos campos obrigatórios, em seguida, o sistema
    exibe uma notificação para o usuário.

    Dado que <codigo> é um novo filme
    Quando eu faço o cadastro deste filme
    Então devo ver a notificação <texto>

    Exemplos:
      | codigo                | texto                                           |
      | "sem_titulo"          | "Oops - Filme sem titulo. Pode isso Arnaldo?"   |
      | "sem_status"          | "Oops - O status deve ser informado!"           |
      | "sem_ano"             | "Oops - Faltou o ano de lançamento também!"     |
      | "sem_data_lançamento" | "Oops - Quase lá, só falta a data de estréia!"  |

@dup_movie
Cenario: Duplicado
    Dado que "deadpool2" é um novo filme
    Mas este filme já existe no catalogo
    Quando eu faço o cadastro deste filme
    Então devo ver a notificação "Oops - Este titulo já existe no Ninjaflix."
    