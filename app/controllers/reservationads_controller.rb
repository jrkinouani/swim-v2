class ReservationadsController < ApplicationController
  before_action :set_reservationad, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!

  def index
    @reservationads = Reservationad.includes(:aquabike).all
  end

  def show
  end

  def destroy
    @reservationads.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationad.update(reservationad_params)
    redirect_to reservationad_path(@reservationad)
  end

  def new
    @adulte = Adulte.find(params[:adulte_id])
    @reservationad = Reservationad.new
    @selected_resa = SelectedResa.where(user_id: current_user.id, resource_id: @adulte.id, resource_type: 'Adulte')
    @selected_resa_count = Reservationpetit.where(nagepetit_id: @adulte.id).sum(:nb_resa) - @selected_resa.count
  end

  def create
    @reservationad = Reservationad.create(reservationad_params)
    if @reservationad.errors.count > 0
        flash[:danger] = @reservationad.errors.full_messages.join(',')
      redirect_to new_reservationad_path(adulte_id: @reservationad.adulte_id)

    else
    adulte = @reservationad.adulte
     if adulte
       price = adulte.price
       if price
        @reservationad.price = adulte.price
       else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
       end
      @reservationad.save
       AdminMailer.infos_reservation(@reservationad).deliver_now
      end
       redirect_to reservationad_path(@reservationad)
     end
  end

  def reservationad_params
    params.require(:reservationad).permit(:start, :price, :adulte_id, :name, :phone, :creneau )
  end

  def set_reservationad
    @reservationad = Reservationad.find(params[:id])
  end
end
