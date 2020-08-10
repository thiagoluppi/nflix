
Quando("eu faço login com {string} e {string}") do |email, senha|
  @login_page.go
  @login_page.logar(email, senha)
end

Então("devo ser autenticado") do
  expect(get_token.length).to be 147
end

Então("devo ver {string} na área logada") do |nome_esperado|
  expect(@sidebar.usuario_logado).to eql nome_esperado
end

Então("não devo ser autenticado") do
  expect(get_token).to be nil
end

Então("devo ver a mensagem de alerta {string}") do |mensagem_esperada|
  expect(@login_page.alertar).to eql mensagem_esperada
end
