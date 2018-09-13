class AgenciaBancariaController < ApplicationController
  def new
    @agencia = AgenciaBancaria.new
  end

  def create
    @agencia = AgenciaBancaria.new(agencia_bancaria_params)
    if @agencia.save
      flash[:success] = "Agência criada com sucesso!"
      redirect_to agencias_bancarias_path
    else
      @agencia = AgenciaBancaria.new
      render 'new'
    end
  end

  def edit
    @agencia = AgenciaBancaria.find(params[:id])
  end

  def update
    @agencia = AgenciaBancaria.find(params[:id])
    if @agencia.update(agencia_bancaria_params)
      redirect_to agencias_bancarias_path
    else
      @agencia = AgenciaBancaria.find(params[:id])
      render 'edit'
    end
  end

  def destroy
    @agencia = AgenciaBancaria.find(params[:id])
    @agencia.destroy
    redirect_to agencias_bancarias_path
  end

  def show
    @agencia = AgenciaBancaria.all.page(params[:page])
  end

  private
    def agencia_bancaria_params
      params.require(:agencia_bancaria).permit(:numero, :endereco)
    end
end
