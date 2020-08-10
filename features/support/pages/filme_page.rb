class FilmePage
  include Capybara::DSL

  def initialize
    @movie_list_css = "table tbody tr"
  end

  def form
    FilmeAdd.new
  end

  def sweet_alert
    SweetAlert.new
  end

  # Clica no botão "+" para cadastrar um filme
  def add
    find(".nc-simple-add").click
  end

  # Método que pega a linha da tabela do titulo do filme
  def filme_tr(titulo)
    find(@movie_list_css, text: titulo)
  end

  # Método que clica no 'x' do botão excluir da linha do titulo do filme
  def remove(titulo)
    filme_tr(titulo).find(".btn-trash").click
  end

  # Método que valida que a página não tem o css com o titulo do filme
  def validar_exclusao(titulo)
    page.has_no_css?(@movie_list_css, text: titulo)
  end

  # Método que valida que o filme não foi excluido
  def invalidar_exclusao(titulo)
    page.has_css?(@movie_list_css, text: titulo)
  end
end
