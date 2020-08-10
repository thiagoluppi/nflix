require "report_builder"
require "date"

Before do
  @login_page = LoginPage.new
  @filme_page = FilmePage.new
  @sidebar = SideBarView.new

  # Maximizar a página do browser na execução do teste
  # page.driver.browser.manage.window.maximize

  # Settar o tamanho da tela para o valor passado
  page.current_window.resize_to(1440, 900)
end

Before("@login") do
  user = CONFIG["users"]["cat_manager"]
  @login_page.go
  @login_page.logar(user["email"], user["pass"])
end

After do |cenario|
  # if cenario.failed?
  temp_shot = page.save_screenshot("log/temp_screenshot.png")
  screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
  embed(screenshot, "image/png", "Screenshot")

  # fiz esse código apenas para salvar o resultado num .txt, pois estava dando problema na hora dessa variavel receber todo o binário
  # e eu queria saber se era por conta de não aparecer no terminal, por não caber ou se não estava mesmo sendo gravado. Era o segundo...
  # File.new("screenshot.txt", "w").puts screenshot
  # end
end

d = DateTime.now
@current_date = d.to_s.tr(":", "-")

at_exit do
  ReportBuilder.configure do |config|
    config.input_path = "log/report.json"
    config.report_path = "log/" + @current_date
    config.report_types = [:html]
    config.report_title = "NinjaFlix - WebApp"
    config.compress_image = true
    config.additional_info = { "App" => "Web", "Data de Execução" => @current_date }
    config.color = "indigo"
  end

  ReportBuilder.build_report
end
