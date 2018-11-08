class ReservationpetitsController < ApplicationController
  before_action :set_reservationpetit, only: [:show, :destroy, :edit, :update]

  def index
    @reservationpetits = Reservationpetit.includes(:palme).all
  end

  def show
  end

  def destroy
    @reservationpetits.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationpetit.update(reservationpetit_params)
    redirect_to reservationpetit_path(@reservationpalme)
  end

  def new
    @nagepetit = Nagepetit.find(params[:nagepetit_id])
    @reservationpetit = Reservationpetit.new
  end

  def create
    @reservationpetit = Reservationpetit.create!(reservationpetit_params)
    nagepetit = @reservationpetit.nagepetit
     if nagepetit
       price = nagepetit.price
       if price
        @reservationpetit.price = nagepetit.price + 20
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationpetit.save
     end
     redirect_to reservationpetit_path(@reservationpetit)
  end

  def reservationpetit_params
    params.require(:reservationpetit).permit(:start, :price, :nagepetit_id, :name, :phone, :creneau,:adhesion )
  end

  def set_reservationpetit
    @reservationpetit = Reservationpetit.find(params[:id])
  end
end
