class ReservationgymsController < ApplicationController
  before_action :set_reservationgym, only: [:show, :destroy, :edit, :update]

  def index
    @reservationgyms = Reservationgym.includes(:aquabike).all
  end

  def show
  end

  def destroy
    @reservationgyms.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationgym.update(reservationgym_params)
    redirect_to reservationgym_path(@reservationgym)
  end

  def new
    @aquagym = Aquagym.find(params[:aquagym_id])
    @reservationgym = Reservationgym.new
  end

  def create
    @reservationgym = Reservationgym.create(reservationgym_params)
    if @reservationgym.errors.count > 0
        flash[:danger] = @reservationgym.errors.full_messages.join(',')
      redirect_to new_reservationgym_path(aquagym_id: @reservationgym.aquagym_id)

    else
     aquagym = @reservationgym.aquagym
     if aquagym
       price = aquagym.price
       if price
        @reservationgym.price = aquagym.price
      else
          flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
      end
      @reservationgym.save
      AdminMailer.info_resa_aquagym(@reservationgym).deliver_now
     end
     redirect_to reservationgym_path(@reservationgym)
   end
  end

  def reservationgym_params
    params.require(:reservationgym).permit(:start, :price, :aquagym_id, :name, :phone, :creneau )
  end

  def set_reservationgym
    @reservationgym = Reservationgym.find(params[:id])
  end

end
