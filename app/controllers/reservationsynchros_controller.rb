class ReservationsynchrosController < ApplicationController
  before_action :set_reservationsynchro, only: [:show, :destroy, :edit, :update]

  def index
    @reservationsynchros = Reservationsynchro.includes(:nagesynchro).all
  end

  def show
  end

  def destroy
    @reservationsynchros.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationsynchro.update(reservationsynchro_params)
    redirect_to reservationsynchro_path(@reservationsynchro)
  end

  def new
    @nagesynchro = Nagesynchro.find(params[:nagesynchro_id])
    @reservationsynchro = Reservationsynchro.new
  end

  def create
    @reservationsynchro = Reservationsynchro.create!(reservationsynchro_params)
    nagesynchro = @reservationsynchro.nagesynchro
     if nagesynchro
       price = nagesynchro.price
       if price
        @reservationsynchro.price = nagesynchro.price + 20
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationsynchro.save
     end
     redirect_to reservationsynchro_path(@reservationsynchro)
  end

  def reservationsynchro_params
    params.require(:reservationsynchro).permit(:start, :price, :nagesynchro_id, :name, :phone, :creneau)
  end

  def set_reservationsynchro
    @reservationsynchro = Reservationsynchro.find(params[:id])
  end
end
