class UsuariosController < ApplicationController
  def new
       @usuario = Usuario.new
  end

  def show
    @usuario = current_usuario
    @movimentacao_bancaria = MovimentacaoBancaria.where(usuario: current_usuario.id).page(params[:page])
  end
end
