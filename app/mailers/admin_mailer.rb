class AdminMailer < ApplicationMailer
  default :from => 'noreply@example.com'
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def infos_reservation(reservationad)
    @reservationad = reservationad
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end
end
