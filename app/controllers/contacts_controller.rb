class ContactsController < ApplicationController
  before_action :set_locale
  
  def index
     @locale = I18n.locale
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        ContactMailer.send_contact_details(@contact).deliver_now
        format.html { redirect_to root_path(params['locale']), notice: 'success_message' }
      else
        format.html { redirect_to root_path(params['locale']), alert: 'error_message' }
       end
    end
  end

  private
  def contact_params
    params.permit(:first_name, :last_name, :email, :phone_number, :message)
  end
  
  def set_locale
    redirect_to root_path(locale: params[:change_locale]) if params[:change_locale]
    extract_locale = params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym) && params[:locale].to_sym
    I18n.locale = extract_locale || I18n.default_locale
  end

end