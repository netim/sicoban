class ContaBancariaController < ApplicationController
  def new
    @agencias = AgenciaBancaria.pluck(:numero)
    @conta_bancaria = ContaBancaria.new
  end

  def create
    @conta_bancaria = ContaBancaria.new(conta_bancaria_params)
    if @conta_bancaria.save
      flash[:success] = "Conta criada com sucesso!"
      redirect_to contas_bancarias_path
    else
      @agencias = AgenciaBancaria.pluck(:numero)
      @conta_bancaria = ContaBancaria.new
      render 'new'
    end
  end

  def edit
    @conta_bancaria = ContaBancaria.find(params[:id])
    @agencias = AgenciaBancaria.pluck(:numero)
  end

  def update
    @conta_bancaria = ContaBancaria.find(params[:id])

    if @conta_bancaria.update(conta_bancaria_params)
      redirect_to contas_bancarias_path
    else
      @conta_bancaria = ContaBancaria.find(params[:id])
      @agencias = AgenciaBancaria.pluck(:numero)
      render 'edit'
    end
  end

  def destroy
    @conta_bancaria = ContaBancaria.find(params[:id])
    @conta_bancaria.destroy
    redirect_to contas_bancarias_path
  end

  def show
    @conta_bancaria = ContaBancaria.all.page(params[:page])
  end

  private
    def conta_bancaria_params
      params.require(:conta_bancaria).permit(:numero_agencia, :numero, :limite)
    end
end
