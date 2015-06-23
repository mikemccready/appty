require "rails_helper"

RSpec.describe User, type: :model do
  it "is invalid without a user_name" do
    user = User.new(user_name: nil, email: "roger@example.com")
    expect(user).to be_invalid
  end 
end