class AquaparcoursController < ApplicationController
  before_action :set_aquaparcour, only: [:show, :update, :destroy, :edit]

  def new
    @aquaparcour = Aquaparcour.new
  end
  def create
    @aquaparcour = Aquaparcour.create(aquaparcour_params)
    redirect_to aquaparcour_path(@aquaparcour)
  end
  def show
  end

  def update
    @aquaparcour.update(aquaparcour_params)
    rediredct_to aquaparcour_path(@aquaparcour)
  end

  def index
    @aquaparcours = Aquaparcour.all
  end
  def edit

  end
  def destroy
  end

  private

  def aquaparcour_params
    params.require(:aquaparcour).permit(:title, :price, :nbpers, :nbseance, :duree, :periode)
  end

  def set_aquaparcour
    @aquaparcour = Aquaparcour.find(params[:id])
  end
end
