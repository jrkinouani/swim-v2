class AquaboxingsController < ApplicationController
  before_action :set_aquaboxing, only: [:show, :update, :destroy, :edit]

  def new
    @aquaboxing = Aquaboxing.new
  end
  def create
    @aquaboxing = Aquaboxing.create(aquaboxing_params)
    redirect_to aquaboxing_path(aquaboxing)
  end
  def show
  end

  def update
    @aquaboxing.update(aquaboxing_params)
    rediredct_to aquaboxing_path(@aquaboxing)
  end

  def index
    @aquaboxings = Aquaboxing.all
  end
  def edit

  end
  def destroy
  end

  private

  def aquaboxing_params
    params.require(:aquaboxing).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
  end

  def set_aquaboxing
    @aquaboxing = Aquaboxing.find(params[:id])
  end
end
