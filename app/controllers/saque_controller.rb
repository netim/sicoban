class SaqueController < ApplicationController
  def new
    init_vars
  end

  def create
    @movimentacao_bancaria = MovimentacaoBancaria.new(movimentacao_bancaria_params)
    limite = ContaBancaria.find_by(numero: @movimentacao_bancaria.numero_conta).limite
    saldo = MovimentacaoBancaria.all.where(numero_conta: @movimentacao_bancaria.numero_conta).sum(:valor)
    if @movimentacao_bancaria.valor > saldo
      init_vars
      flash[:error] = "Saque maior que o saldo."
      render 'new'
    elsif @movimentacao_bancaria.valor > limite
      init_vars
      flash[:error] = "Saque maior que o limite."
      render 'new'
    else
      @movimentacao_bancaria.data_movimentacao = DateTime.now
      @movimentacao_bancaria.valor = -@movimentacao_bancaria.valor
      if @movimentacao_bancaria.save
        flash[:success] = "Saque realizado com sucesso!"
        redirect_to root_url
      else
        init_vars
        render 'new'
      end
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
