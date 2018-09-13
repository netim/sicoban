class MovimentacaoBancariaController < ApplicationController
  def new
    @movimentacao_bancaria = current_usuario.movimentacao_bancaria.build
  end

  def create
    @movimentacao_bancaria = current_usuario.movimentacao_bancaria.build(movimentacao_bancaria_params)
    if @movimentacao_bancaria.save
      flash[:success] = "Movimentação bancária realizada com sucesso!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
  end

  def show
    @movimentacao_bancaria = MovimentacaoBancaria.find(params[:id])
  end

  private

    def movimentacao_bancaria_params
      params.require(:movimentacao_bancaria).permit(:valor)
    end
end
