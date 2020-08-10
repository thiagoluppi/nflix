class LoginPage
  include Capybara::DSL

  def go
    visit "/"
  end

  def logar(email, senha)
    fill_in "emailId", with: email
    fill_in "passId", with: senha
    click_button "Entrar"
  end

  def alertar
    find(".alert span").text
  end
end
