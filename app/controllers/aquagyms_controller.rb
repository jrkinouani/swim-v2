class AquagymsController < ApplicationController
  before_action :set_aquagym, only: [:show, :update, :destroy, :edit]

  def new
    @aquagym = Aquagym.new
  end
  def create
    @aquagym = Aquagym.create(aquagym_params)
    redirect_to aquagym_path(@aquagym)
  end
  def show
  end

  def update
    @aquagym.update(aquagym_params)
    rediredct_to aquagym_path(@aquagym)
  end

  def index
    @aquagyms = Aquagym.all
  end
  def edit

  end
  def destroy
  end

  private

  def aquagym_params
    params.require(:aquagym).permit(:title, :price, :participant, :nbpers, :nbseance, :duree, :periode)
  end

  def set_aquagym
    @aquagym = Aquagym.find(params[:id])
  end
end
