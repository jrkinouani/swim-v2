class ReservationecolesController < ApplicationController
  before_action :set_reservationecole, only: [:show, :destroy, :edit, :update]

  def index
    @reservationecoles = Reservationecole.includes(:ecole).all
  end

  def show
  end

  def destroy
    @reservationecoles.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationecole.update(reservationecole_params)
    redirect_to reservationecole_path(@reservationecole)
  end

  def new
    @ecole = Ecole.find(params[:ecole_id])
    @reservationecole = Reservationecole.new
  end

  def create
    @reservationecole = Reservationecole.create(reservationecole_params)
    if @reservationecole.errors.count > 0
        flash[:danger] = @reservationecole.errors.full_messages.join(',')
      redirect_to new_reservationecole_path(ecole_id: @reservationecole.ecole_id)
    else
      ecole = @reservationecole.ecole
       if ecole
         price = ecole.price
         if price
          @reservationecole.price = ecole.price + 20
        else
            flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
        end
        @reservationecole.save
        AdminMailer.info_resa_ecole(@reservationecole).deliver_now
       end
       redirect_to reservationecole_path(@reservationecole)
     end
  end

  def reservationecole_params
    params.require(:reservationecole).permit(:start, :price, :ecole_id, :name, :phone, :creneau )
  end

  def set_reservationecole
    @reservationecole = Reservationecole.find(params[:id])
  end
end
