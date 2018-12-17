class ReservationboxingsController < ApplicationController
  before_action :set_reservationboxing, only: [:show, :destroy, :edit, :update]

  def index
    @reservationboxings = Reservationboxing.includes(:aquaboxing).all
  end

  def show
  end

  def destroy
    @reservationboxings.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationboxing.update(reservationboxing_params)
    redirect_to reservationboxing_path(@reservationboxing)
  end

  def new
    @aquaboxing = Aquaboxing.find(params[:aquaboxing_id])
    @reservationboxing = Reservationboxing.new
  end

  def create
    @reservationboxing = Reservationboxing.create(reservationboxing_params)
    if @reservationboxing.errors.count > 0
        flash[:danger] = @reservationboxing.errors.full_messages.join(',')
      redirect_to new_reservationboxing_path(aquaboxing_id: @reservationboxing.aquaboxing_id)
    else
      aquaboxing =  @reservationboxing.aquaboxing
     if aquaboxing
       price = aquaboxing.price
       if price
          @reservationboxing.price = aquaboxing.price
       else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
       end
        @reservationboxing.save
      end
      redirect_to reservationboxing_path(@reservationboxing)
    end
  end

  def reservationboxing_params
    params.require(:reservationboxing).permit(:start, :price, :aquaboxing_id, :name, :phone, :creneau )
  end

  def set_reservationboxing
    @reservationboxing = Reservationboxing.find(params[:id])
  end
end
