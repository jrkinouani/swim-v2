class ReservationstaticsController < ApplicationController
  before_action :set_reservationstatic, only: [:show, :destroy, :edit, :update]

  def index
    @reservationstatics = Reservationstatic.includes(:staticswim).all
  end

  def show
  end

  def destroy
    @reservationstatics.destroy
    head :ok
  end

  def edit
  end

  def update
    @reservationstatic.update(reservationstatic_params)
    redirect_to reservationstatic_path(@reservationstatic)
  end

  def new
    @staticswim = Staticswim.find(params[:staticswim_id])
    @reservationstatic = Reservationstatic.new
  end

  def create
    @reservationstatic = Reservationstatic.create(reservationstatic_params)
    if @reservationstatic.errors.count > 0
        flash[:danger] = @reservationstatic.errors.full_messages.join(',')
      redirect_to new_reservationstatic_path(staticswim_id: @reservationstatic.staticswim_id)
    else
      staticswim = @reservationstatic.staticswim
       if staticswim
         price = staticswim.price
         if price
          @reservationstatic.price = staticswim.price
        else
            flash[:danger] = 'Vous avez mal renseigné les champs de textes !'
        end
        @reservationstatic.save
        AdminMailer.info_resa_static(@reservationstatic).deliver_now
       end
       redirect_to reservationstatic_path(@reservationstatic)
     end
  end

  def reservationstatic_params
    params.require(:reservationstatic).permit(:start, :price, :staticswim_id, :name, :phone, :creneau )
  end

  def set_reservationstatic
    @reservationstatic = Reservationstatic.find(params[:id])
  end
end
