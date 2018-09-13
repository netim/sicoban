class TransferenciaController < ApplicationController
  def new
   init_vars
  end

  def create
    data = DateTime.now
    @transferencias = []
    params[:movimentacao_bancaria]["transferencias"].each do |t|
      movimentacao = MovimentacaoBancaria.new
      movimentacao.valor = t["valor"]
      movimentacao.tipo_movimentacao = t["tipo_movimentacao"]
      movimentacao.numero_conta = t["numero_conta"]
      movimentacao.usuario = t["usuario"]
      movimentacao.data_movimentacao = data
      @transferencias << movimentacao
    end
    limite = ContaBancaria.find_by(numero: @transferencias[0]["numero_conta"]).limite
    saldo = MovimentacaoBancaria.all.where(numero_conta: @transferencias[0]["numero_conta"]).sum(:valor)
     valor = params[:movimentacao_bancaria]["valor"].to_i
    if valor > limite
      init_vars
      flash[:error] = "Transferência maior que o limite."
      render 'new'
    elsif valor > saldo
      init_vars
      flash[:error] = "Transferência maior que o saldo."
      render 'new'
    else
      @transferencias[0]["valor"] = -valor
      @transferencias[1]["valor"] = valor
      @transferencias.each do |t|
        if !t.save
          init_vars
          flash[:error] = "Ocorreu um problema."
          render 'new'
          return
        end
      end
      flash[:success] = "Transferência realizada com sucesso!"
      redirect_to root_url
    end

  end

  def destroy
  end

  def show
    @movimentacao_bancaria = MovimentacaoBancaria.find(params[:id])
  end

  private

    def transferencia_params(mb)
      mb.require(:transferencias).permit(:valor, :numero_conta, :tipo_movimentacao, :usuario, :data_movimentacao)
    end

    def init_vars
      @contas = ContaBancaria.all
      @saldos = []
      @contas.each do |c|
        saldo = []
        saldo[0] = c.numero.to_s << " (saldo: #{MovimentacaoBancaria.all.where(numero_conta: c.numero).sum(:valor)}, "
        saldo[0] = saldo[0] << "limite: #{c.limite})"
        saldo[1] = c.numero
        saldo[2] = MovimentacaoBancaria.all.where(numero_conta: c.numero).sum(:valor)
        saldo[3] = c.limite
        @saldos << saldo
      end
      @movimentacao_bancaria = []
      2.times do
        @movimentacao_bancaria << MovimentacaoBancaria.new
     end
    end
end
