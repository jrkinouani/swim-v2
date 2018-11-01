class StaticswimsController < ApplicationController
  before_action :set_staticswim, only: [:show, :update, :destroy, :edit]

  def new
    @staticswim = Staticswim.new
  end
  def create
  @staticswim = Staticswim.create(staticswim_params)
    redirect_to staticswim_path(@staticswim)
  end
  def show
  end

  def update
    @staticswim.update(staticswim_params)
    rediredct_to staticswim_path(@staticswim)
  end

  def index
    @staticswim = Staticswim.all
  end
  def edit

  end
  def destroy
  end

  private

  def staticswim_params
    params.require(:staticswim).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
  end

  def set_staticswim
  @staticswim = Staticswim.find(params[:id])
  end
end
