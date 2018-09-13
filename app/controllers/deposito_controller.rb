class DepositoController < ApplicationController
  def new
    init_vars
  end

  def create
    @movimentacao_bancaria = MovimentacaoBancaria.new(movimentacao_bancaria_params)
    @movimentacao_bancaria.data_movimentacao = DateTime.now
    if @movimentacao_bancaria.save
      flash[:success] = "Depósito realizado com sucesso!"
      redirect_to root_url
    else
      init_vars
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
      params.require(:movimentacao_bancaria).permit(:valor, :usuario, :numero_conta, :tipo_movimentacao)
    end

    def init_vars
      @saldos = []
      ContaBancaria.all.each do |c|
        saldo = []
        saldo[0] = c.numero.to_s << " (saldo: #{MovimentacaoBancaria.all.where(numero_conta: c.numero).sum(:valor)}, "
        saldo[0] = saldo[0] << "limite: #{c.limite})"
        saldo[1] = c.numero
        saldo[2] = MovimentacaoBancaria.all.where(numero_conta: c.numero).sum(:valor)
        saldo[3] = c.limite
        @saldos << saldo
      end
      @movimentacao_bancaria = MovimentacaoBancaria.new #current_usuario.movimentacao_bancarias.build #
    end
end
