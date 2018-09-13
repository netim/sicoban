class EstornoController < ApplicationController
  def new
    @movimentacao_bancaria = MovimentacaoBancaria.find(params[:id])
  end

  def create
    @movimentacao_bancaria = MovimentacaoBancaria.find(params[:id])
    valor = @movimentacao_bancaria["valor"].to_i
    @transferencias = MovimentacaoBancaria.where(data_movimentacao: @movimentacao_bancaria.data_movimentacao)
    data = DateTime.now
    @estorno = []
    @transferencias.each do |t|
      transferencia = MovimentacaoBancaria.new
      transferencia.valor = -t["valor"].to_i
      transferencia.tipo_movimentacao = 'Estorno'
      transferencia.numero_conta = t["numero_conta"]
      transferencia.usuario = t["usuario"]
      transferencia.data_movimentacao = data
      @estorno << transferencia
    end
    limite = ContaBancaria.find_by(numero: @estorno[1]["numero_conta"]).limite
    saldo = MovimentacaoBancaria.all.where(numero_conta: @estorno[1]["numero_conta"]).sum(:valor)
    if valor > limite
      flash[:error] = "Estorno maior que o limite."
      redirect_to root_url
    elsif valor > saldo
      flash[:error] = "Estorno maior que o saldo."
      redirect_to root_url
    else
      @estorno[0]["valor"] = -valor
      @estorno[1]["valor"] = valor
      @estorno.each do |e|
        if !e.save
          redirect_to root_url
        end
      end
      flash[:success] = "Estorno realizado com sucesso!"
      redirect_to root_url
    end
  end
end
