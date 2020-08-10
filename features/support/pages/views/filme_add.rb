class FilmeAdd
  include Capybara::DSL

  # Método que preenche os campos de cadastro de filme
  def create(filme)
    find("input[name=title]").set filme["titulo"]

    # Chama o método que seleciona o status do filme, se status não estiver vazio
    select_status(filme["status"]) unless filme["status"].empty?

    find("input[name=year]").set filme["ano"]
    find("input[name=release_date]").set filme["data_lançamento"]

    # Usa o array de strings de atores e manda a tecla tab
    atores = find(".input-new-tag")
    filme["elenco"].each do |a|
      atores.set(a)
      atores.send_keys :tab
    end

    find("textarea[name=overview]").set filme["sinópse"]

    # Chama o método que faz upload da capa do filme, se capa não estiver vazia
    upload(filme["capa"]) unless filme["capa"].empty?

    click_button "create-movie"
  end

  def alerta
    find(".alert").text
  end

  # Método que faz upload da capa do filme
  def upload(file)
    cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)

    # Muda as barras / para barras invertidas do Windows, se o S.O for Windows
    cover_file = cover_file.tr("/", "\\") if OS.windows?

    # Faz o Capybara não ignorar elementos ocultos
    Capybara.ignore_hidden_elements = false

    attach_file("upcover", cover_file)

    # Faz ele ignorar elementos ocultos novamente
    Capybara.ignore_hidden_elements = true
  end

  # Método que seleciona o status do filme
  def select_status(status)
    find("input[placeholder=Status]").click
    find(".el-select-dropdown__item", text: status).click
  end
end
