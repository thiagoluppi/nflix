Dado("que {string} é um novo filme") do |codigo_filme|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/filmes.yaml"))
  @filme = file[codigo_filme]

  Database.new.delete_movie(@filme["titulo"])
end

Dado("este filme já existe no catalogo") do
  Database.new.insert_movie(@filme)
end

Quando("eu faço o cadastro deste filme") do
  @filme_page.add
  @filme_page.form.create(@filme)
end

Então("devo ver o novo filme na lista") do
  resultado = @filme_page.filme_tr(@filme["titulo"])
  expect(resultado).to have_text @filme["titulo"]
  expect(resultado).to have_text @filme["status"]
end

Então("devo ver a notificação {string}") do |alerta_esperado|
  expect(@filme_page.form.alerta).to eql alerta_esperado
end

Dado("que {string} esta no catalogo") do |codigo_filme|
  steps %{
    Dado que "#{codigo_filme}" é um novo filme
    E este filme já existe no catalogo
  }
end

Quando("eu solicito a exclusao") do
  @filme_page.remove(@filme["titulo"])
end

Quando("eu confirmo a solicitacao") do
  @filme_page.sweet_alert.confirmar_solicitacao
end

Quando("cancelo a solicitacao") do
  @filme_page.sweet_alert.cancelar_solicitacao
end

Então("este item deve ser removido do catalogo") do
  expect(@filme_page.validar_exclusao(@filme["titulo"])).to be true
end

Então("este item deve permanecer no catalogo") do
  expect(@filme_page.invalidar_exclusao(@filme["titulo"])).to be true
end
