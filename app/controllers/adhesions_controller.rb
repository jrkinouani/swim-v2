class AdhesionsController < ApplicationController
  def new
    @adhesion = Adhesion.new
  end
  def create
  @adhesion = Adhesion.create(adhesion_params)
    redirect_to adhesion_path(@adhesion)
  end
  def show
  end

  def update
    @adhesion.update(adhesion_params)
    rediredct_to adhesion_path(@adhesion)
  end

  def index
    @adhesions = Adhesion.all
  end
  def edit

  end
  def destroy
  end

  private

  def adhesion_params
    params.require(:adhesion).permit(:name, :email, :date, :phone, :adresse)
  end

  def set_adhesion
  @adhesion = Adhesion.find(params[:id])
  end
end
