class ReservationpalmesController < ApplicationController
  before_action :set_reservationpalme, only: [:show, :destroy, :edit, :update]

  def index
    @reservationpalmes = Reservationad.includes(:palme).all
  end

  def show
  end

  def destroy
    @reservationpalmes.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationpalme.update(reservationpalme_params)
    redirect_to reservationpalme_path(@reservationpalme)
  end

  def new
    @palme = Palme.find(params[:palme_id])
    @reservationpalme = Reservationpalme.new
  end

  def create
    @reservationpalme = Reservationpalme.create!(reservationpalme_params)
    palme = @reservationpalme.palme
     if palme
       price = palme.price
       if price
        @reservationpalme.price = palme.price
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationpalme.save
     end
     redirect_to reservationpalme_path(@reservationpalme)
  end

  def reservationpalme_params
    params.require(:reservationpalme).permit(:start, :price, :palme_id, :name, :phone, :creneau )
  end

  def set_reservationpalme
    @reservationpalme = Reservationpalme.find(params[:id])
  end
end
