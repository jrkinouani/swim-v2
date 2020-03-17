class ReservationpetitsController < ApplicationController
  before_action :set_reservationpetit, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!

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
    @selected_resa = SelectedResa.where(user_id: current_user.id, resource_id: @nagepetit.id, resource_type: 'Nagepetit')
    @selected_resa_count = Reservationpetit.where(nagepetit_id: @nagepetit.id, user_id: current_user.id).sum(:nb_resa) - @selected_resa.count
  end

  def create
    @reservationpetit = Reservationpetit.create(reservationpetit_params)
    if @reservationpetit.errors.count > 0
        flash[:danger] = @reservationpetit.errors.full_messages.join(',')
      redirect_to new_reservationpetit_path(nagepetit_id: @reservationpetit.nagepetit_id)
    else
      nagepetit = @reservationpetit.nagepetit
       if nagepetit
         price = nagepetit.price
         if price
          @reservationpetit.price = nagepetit.price + 20
         else
            flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
         end
        @reservationpetit.save
        AdminMailer.info_resa_petit(@reservationpetit).deliver_now
       end
       redirect_to reservationpetit_path(@reservationpetit)
     end
  end

  def reservationpetit_params
    params.require(:reservationpetit).permit(:start, :price, :nagepetit_id, :name, :phone, :creneau,:adhesion )
  end

  def set_reservationpetit
    @reservationpetit = Reservationpetit.find(params[:id])
  end
end
