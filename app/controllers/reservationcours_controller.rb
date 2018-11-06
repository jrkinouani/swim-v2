class ReservationcoursController < ApplicationController
  before_action :set_reservationcour, only: [:show, :destroy, :edit, :update]

  def index
    @reservationcours = Reservationcour.includes(:aquaparcour).all
  end

  def show
  end

  def destroy
    @reservationcours.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationcour.update(reservationcour_params)
    redirect_to reservationcour_path(@reservationcour)
  end

  def new
    @aquaparcour = Aquaparcour.find(params[:aquaparcour_id])
    @reservationcour = Reservationcour.new
  end

  def create
    @reservationcour = Reservationcour.create!(reservationcour_params)
    aquaparcour = @reservationcour.aquaparcour
     if aquaparcour
       price = aquaparcour.price
       if price
        @reservationcour.price = aquaparcour.price
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationcour.save
     end
     redirect_to reservationcour_path(@reservationcour)
  end

  def reservationcour_params
    params.require(:reservationcour).permit(:start, :price, :aquaparcour_id, :name, :phone, :creneau )
  end

  def set_reservationcour
    @reservationcour = Reservationcour.find(params[:id])
  end
end
