class ReservationjardsController < ApplicationController
  before_action :set_reservationjard, only: [:show, :destroy, :edit, :update]

  def index
    @reservationjards = Reservationjard.includes(:jardin).all
  end

  def show
  end

  def destroy
    @reservationjards.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationjard.update(reservationjard_params)
    redirect_to reservationjard_path(@reservationjard)
  end

  def new
    @jardin = Jardin.find(params[:jardin_id])
    @reservationjard = Reservationjard.new
  end

  def create
    @reservationjard = Reservationjard.create(reservationjard_params)
    if @reservationjard.errors.count > 0
        flash[:danger] = @reservationjard.errors.full_messages.join(',')
      redirect_to new_reservationjard_path(jardin_id: @reservationjard.jardin_id)
    else
    jardin = @reservationjard.jardin
     if jardin
       price = jardin.price
       if price
        @reservationjard.price = jardin.price + 20
       else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
       end
      @reservationjard.save
      AdminMailer.info_resa_jardin(@reservationjard).deliver_now
      end
       redirect_to reservationjard_path(@reservationjard)
     end
  end

  def reservationjard_params
    params.require(:reservationjard).permit(:start, :price, :jardin_id, :name, :phone, :creneau )
  end

  def set_reservationjard
    @reservationjard = Reservationjard.find(params[:id])
  end
end
