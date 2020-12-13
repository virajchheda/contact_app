class Contact < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email, :message
  after_commit :send_contact_detail_mail, on: :create

  def send_contact_detail_mail
    ContactMailer.send_contact_details(self).deliver_later
  end
end
