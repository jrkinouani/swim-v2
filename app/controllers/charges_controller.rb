class ChargesController < ApplicationController

  def new
    if params[:reservation_id]
      @reservation = Reservation.find(params[:reservation_id])
    else
      @reservationgym = Reservationgym.find(params[:reservationgym_id])
    end
  end

  def create
    if params[:reservation_id]
     @reservation = Reservation.find(params["reservation_id"])
     @amount = @reservation.price.to_i * 100
    else
     @reservationgym = Reservationgym.find(params["reservationgym_id"])
     @amount = @reservationgym.price.to_i * 100
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
