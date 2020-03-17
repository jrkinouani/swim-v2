class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!

  def index
    @reservations = Reservation.includes(:aquabike).all
  end

  def show
  end

  def destroy
    @reservation.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def new
    @aquabike = Aquabike.find(params[:aquabike_id])
    @reservation = Reservation.new
    @selected_resa = SelectedResa.where(user_id: current_user.id, resource_id: @aquabike.id, resource_type: 'Aquabike')
    @selected_resa_count = Reservation.where(aquabike_id: @aquabike.id, user_id: current_user.id).sum(:nb_resa) - @selected_resa.count
  end

  def create
    @reservation = Reservation.create(reservation_params)
    if @reservation.errors.count > 0
        flash[:danger] = @reservation.errors.full_messages.join(',')
      redirect_to new_reservation_path(aquabike_id: @reservation.aquabike_id)
    else
     aquabike = @reservation.aquabike
       if aquabike
         price = aquabike.price
         if price
          @reservation.price = aquabike.price
        else
            flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
        end
        @reservation.save
        AdminMailer.info_resa_aquabike(@reservation).deliver_now
       end
       redirect_to reservation_path(@reservation)
     end
  end

  def reservation_params
    params.require(:reservation).permit(:start, :price, :aquabike_id, :phone, :name, :creneau, :email )
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

end
