class SweetAlert
  include Capybara::DSL

  # Método que clica na confirmação do botão excluir
  def confirmar_solicitacao
    find(".swal2-confirm").click
  end

  # Método que clica no cancelar exclusão do botão excluir
  def cancelar_solicitacao
    find(".swal2-cancel").click
  end
end
