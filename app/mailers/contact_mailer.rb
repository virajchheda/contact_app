class ContactMailer < ApplicationMailer

  def send_contact_details(contact)
    @contact = contact
    mail(
      from: "Notification <test@gmail.com>",
      to: 'info@ajackus.com', 
      subject: "Contact Details of #{@contact.first_name}!"
    )
  end

end
