class AdultesController < ApplicationController
  before_action :set_adulte, only: [:show, :update, :destroy, :edit]

  def new
    @adulte = Adulte.new
  end
  def create
  @adulte = Adulte.create(adulte_params)
    redirect_to adulte_path(@adulte)
  end
  def show
  end

  def update
    @adulte.update(adulte_params)
    rediredct_to adulte_path(@adulte)
  end

  def index
    @adulte = Adulte.all
  end
  def edit

  end
  def destroy
  end

  private

  def adulte_params
    params.require(:adulte).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
  end

  def set_adulte
  @adulte = Adulte.find(params[:id])
  end
end
