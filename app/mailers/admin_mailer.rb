class AdminMailer < ApplicationMailer
  default :from => 'noreply@example.com'
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def infos_reservation(reservationad)
    @reservationad = reservationad
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_boxing(reservationboxing)
    @reservationboxing = reservationboxing
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_static(reservationstatic)
    @reservationstatic = reservationstatic
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_palme(reservationpalme)
    @reservationpalme = reservationpalme
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_aquabike(reservation)
    @reservation = reservation
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_ecole(reservationecole)
    @reservationecole = reservationecole
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_jardin(reservationjard)
    @reservationjard = reservationjard
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_petit(reservationpetit)
    @reservationpetit = reservationpetit
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

  def info_resa_aquagym(reservationgym)
    @reservationgym = reservationgym
    mail(to: 'kinouani@gmail.com', subject: "Nouveau message depuis le site")
  end

end
