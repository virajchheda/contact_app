require 'rails_helper'

RSpec.describe Contact, type: :model do

  subject { 
    described_class.new(first_name: "test", last_name: "test", message: "test message", email: "test@test.com")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a message" do
    subject.message = nil 
    expect(subject).to_not be_valid
  end
end
