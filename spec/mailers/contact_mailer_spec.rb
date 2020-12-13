require "rails_helper"
require 'rspec/active_model/mocks'

RSpec.describe ContactMailer, type: :mailer do
  let(:contact) { mock_model Contact, first_name: 'Mark', last_name: 'Brown', email: 'mark@email.com', message:'can we connect?' }
  let(:mail) { ContactMailer.send_contact_details(contact) }

  it 'renders the headers' do
    expect(mail.subject).to eq("Contact Details of #{contact.first_name}!")
    expect(mail.to).to eq(["info@ajackus.com"])
  end

  it 'renders the body' do
    expect(mail.body).to match("Details of")
  end
end
