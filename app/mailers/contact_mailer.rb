class ContactMailer < ApplicationMailer

  def send_contact_details(contact)
    @contact = contact
    mail(
      from:'Notification <test@gmail.com>',
      to: 'chhedavd@gmail.com', 
      subject: 'Contact submitted!'
    )
  end

end
