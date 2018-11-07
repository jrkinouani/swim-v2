class NagepetitsController < ApplicationController
  before_action :set_nagepetit, only: [:show, :update, :destroy, :edit]

  def new
    @nagepetit = Nagepetit.new
  end

  def create
    @nagepetit = Nagepetit.create(nagepetit_params)
    redirect_to nagepetit_path(@nagepetit)
  end

  def show
  end

  def update
    @nagepetit.update(nagepetit_params)
    rediredct_to nagepetit_path(@nagepetit)
  end

  def index
    @nagepetits = Nagepetit.all
  end
  def edit

  end
  def destroy
  end

  private

  def nagepetit_params
    params.require(:nagepetit).permit(:title, :price, :price, :duree, :periode, :nbpers)
  end

  def set_nagepetit
    @nagepetit = Nagepetit.find(params[:id])
  end
end
