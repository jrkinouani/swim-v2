class ChargesController < ApplicationController

  def new
    if params[:reservation_id]
      @reservation = Reservation.find(params[:reservation_id])
    elsif params[:reservationgym_id]
      @reservationgym = Reservationgym.find(params[:reservationgym_id])
    elsif params[:reservationpalme_id]
      @reservationpalme = Reservationpalme.find(params[:reservationpalme_id])
    elsif params[:reservationstatic_id]
      @reservationstatic = Reservationstatic.find(params[:reservationstatic_id])
    elsif params[:reservationcour_id]
      @reservationcour = Reservationcour.find(params[:reservationcour_id])
    elsif params[:reservationboxing_id]
      @reservationboxing = Reservationboxing.find(params[:reservationboxing_id])
    elsif params[:reservationjard_id]
      @reservationjard = Reservationjard.find(params[:reservationjard_id])
    elsif params[:reservationpetit_id]
      @reservationpetit = Reservationpetit.find(params[:reservationpetit_id])
    else
      @reservationad = Reservationad.find(params[:reservationad_id])
    end
  end

  def create
   if params[:reservation_id]
     @reservation = Reservation.find(params["reservation_id"])
     @amount = @reservation.price.to_i * 100
    elsif params[:reservationgym_id]
     @reservationgym = Reservationgym.find(params["reservationgym_id"])
     @amount = @reservationgym.price.to_i * 100
    elsif params[:reservationpalme_id]
     @reservationpalme = Reservationpalme.find(params["reservationpalme_id"])
     @amount = @reservationpalme.price.to_i * 100
    elsif params[:reservationstatic_id]
      @reservationstatic = Reservationstatic.find(params["reservationstatic_id"])
      @amount = @reservationstatic.price.to_i * 100
    elsif params[:reservationcour_id]
      @reservationcour = Reservationcour.find(params["reservationcour_id"])
      @amount = @reservationcour.price.to_i * 100
    elsif params[:reservationboxing_id]
      @reservationboxing = Reservationboxing.find(params["reservationboxing_id"])
      @amount = @reservationboxing.price.to_i * 100
    elsif params[:reservationjard_id]
      @rreservationjard = Reservationjard.find(params["reservationjard_id"])
      @amount = @reservationjard.price.to_i * 100  
    elsif params[:reservationpetit_id]
      @reservationpetit = Reservationpetit.find(params["reservationpetit_id"])
      @amount = @reservationpetit.price.to_i * 100
    else
      @reservationad = Reservationad.find(params["reservationad_id"])
      @amount = @reservationad.price.to_i * 100
    end
         customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :source  => params[:stripeToken]
     )

     charge = Stripe::Charge.create(
       :customer    => customer.id,
       :amount      => @amount,
       :description => 'Rails Stripe customer',
       :currency    => 'eur'
     )
     #@reservation = Reservation.find(params["reservation_id"])
      #Notifier.paiement(@reservation).deliver

    rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to new_charge_path
  end
end
