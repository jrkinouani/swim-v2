class PolosController < ApplicationController
  before_action :set_polo, only: [:show, :update, :destroy, :edit]

  def new
    @polo = Polo.new
  end
  def create
    @polo = Polo.create(polo_params)
    redirect_to polo_path(@palme)
  end
  def show
  end

  def update
    @polo.update(palme_params)
    rediredct_to polo_path(@polo)
  end

  def index
    @polos = Polo.all
  end
  def edit

  end
  def destroy
  end

  private

  def polo_params
    params.require(:polo).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
  end

  def set_polo
    @polo = Polo.find(params[:id])
  end
end
