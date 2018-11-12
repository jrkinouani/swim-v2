class NagesynchrosController < ApplicationController
  before_action :set_nagesynchro, only: [:show, :update, :destroy, :edit]

  def new
    @nagesynchro = Nagesynchro.new
  end

  def create
    @nagesynchro = Nagesynchro.create(nagesynchro_params)
    redirect_to nagesynchro_path(@nagesynchro)
  end

  def show
  end

  def update
    @nagesynchro.update(nagesynchro_params)
    rediredct_to nagesynchro_path(@nagesynchro)
  end

  def index
    @nagesynchros = Nagesynchro.all
  end
  def edit

  end
  def destroy
  end

  private

  def nagesynchro_params
    params.require(:nagesynchro).permit(:title, :price, :price, :duree, :periode, :nbpers)
  end

  def set_nagesynchro
    @nagesynchro = Nagesynchro.find(params[:id])
  end
end
