class SideBarView
  include Capybara::DSL

  def usuario_logado
    find(".sidebar-wrapper .user .info span").text
  end
end
