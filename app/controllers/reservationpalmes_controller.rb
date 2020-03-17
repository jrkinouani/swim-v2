class ReservationpalmesController < ApplicationController
  before_action :set_reservationpalme, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!


  def index
    @reservationpalmes = Reservationpalme.includes(:palme).all
  end

  def show
  end

  def destroy
    @reservationpalme.destroy
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
    @selected_resa = SelectedResa.where(user_id: current_user.id, resource_id: @palme.id, resource_type: 'Palme')
    @selected_resa_count = Reservationpalme.where(palme_id: @palme.id, user_id: current_user.id).sum(:nb_resa) - @selected_resa.count
  end

  def create
    @reservationpalme = Reservationpalme.create(reservationpalme_params)
    if @reservationpalme.errors.count > 0
        flash[:danger] = @reservationpalme.errors.full_messages.join(',')
      redirect_to new_reservationpalme_path(adulte_id: @reservationpalme.palme_id)

    else
    palme = @reservationpalme.palme
     if palme
       price = palme.price
       if price
        @reservationpalme.price = palme.price + 20
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationpalme.save
      AdminMailer.info_resa_palme(@reservationpalme).deliver_now
       end
       redirect_to reservationpalme_path(@reservationpalme)
     end
  end

  def reservationpalme_params
    params.require(:reservationpalme).permit(:start, :price, :palme_id, :name, :phone, :creneau )
  end

  def set_reservationpalme
    @reservationpalme = Reservationpalme.find(params[:id])
  end
end
