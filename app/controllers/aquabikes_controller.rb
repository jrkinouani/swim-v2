class AquabikesController < ApplicationController
  before_action :set_aquabike, only: [:show, :update, :destroy, :edit]

  def new
    @aquabike = Aquabike.new
  end
  
  def create
    @aquabike = Aquabike.create(aquabike_params)
    redirect_to aquabike_path(@aquabike)
  end
  def show
  end

  def update
    @aquabike.update(aquabike_params)
    rediredct_to aquabike_path(@aquabike)
  end

  def index
    @aquabikes = Aquabike.all
  end
  def edit

  end
  def destroy
  end

  private

  def aquabike_params
    params.require(:aquabike).permit(:title, :price)
  end

  def set_aquabike
    @aquabike = Aquabike.find(params[:id])
  end

end
