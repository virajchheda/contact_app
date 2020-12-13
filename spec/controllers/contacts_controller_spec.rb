require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

  context "post create functionality" do
    it "should save and return success message" do
      post :create, params: { 'first_name': "Mark", 'last_name': "Brown", 'message': "can we connect?", 'phone': "9999999999", 'email': "mark@gmail.com" }

      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(flash[:notice]).to eq "success_message"
    end

    it "should not save and return error message as message is empty" do
      post :create, params: { 'first_name': "Mark", 'last_name': "Brown", 'message': "", 'phone': "9999999999", 'email': "mark@gmail.com" }

      expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      expect(flash[:alert]).to eq "error_message"
      end
    end

end