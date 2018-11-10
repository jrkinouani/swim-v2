class ReservationpolosController < ApplicationController
  before_action :set_reservationpolo, only: [:show, :destroy, :edit, :update]

  def index
    @reservationpolos = Reservationpolo.includes(:polo).all
  end

  def show
  end

  def destroy
    @reservationpolos.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationpolo.update(reservationpolo_params)
    redirect_to reservationpolo_path(@reservationpolo)
  end

  def new
    @polo = Polo.find(params[:polo_id])
    @reservationpolo = Reservationpolo.new
  end

  def create
    @reservationpolo = Reservationpolo.create!(reservationpolo_params)
    polo = @reservationpolo.polo
     if polo
       price = polo.price
       if price
        @reservationpolo.price = polo.price + 20
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationpolo.save
     end
     redirect_to reservationpolo_path(@reservationpolo)
  end

  def reservationpolo_params
    params.require(:reservationpolo).permit(:start, :price, :polo_id, :name, :phone, :creneau,:adhesion )
  end

  def set_reservationpolo
    @reservationpolo = Reservationpolo.find(params[:id])
  end
end
