class ContactsController < ApplicationController

  def index
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Form successfully submitted. Thank You!' }
      else
        @notice = "not submitted"
        format.html { redirect_to root_path, notice: @contacts.errors.full_messages }
      end
    end
  end

  private
  def contact_params
    params.permit(:first_name, :last_name, :email, :phone_number, :message)
  end

end