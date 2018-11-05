class PalmesController < ApplicationController
  before_action :set_palme, only: [:show, :update, :destroy, :edit]

  def new
    @palme = Palme.new
  end
  def create
    @palme = Palme.create(palme_params)
    redirect_to palme_path(@palme)
  end
  def show
  end

  def update
    @palme.update(palme_params)
    rediredct_to palme_path(@palme)
  end

  def index
    @palmes = Palme.all
  end
  def edit

  end
  def destroy
  end

  private

  def palme_params
    params.require(:palme).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
  end

  def set_palme
    @palme = Palme.find(params[:id])
  end
end
