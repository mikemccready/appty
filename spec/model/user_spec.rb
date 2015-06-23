require "rails_helper"

RSpec.describe User, type: :model do
  it "is invalid without a user_name" do
    user = User.new(user_name: nil, email: "roger@example.com")
    expect(user).to be_invalid
  end 

  it "is invalid without a email" do
    user = User.new(user_name: "some guy", email: nil)
    expect(user).to be_invalid
  end 

 	it "is invalid if email isn't formatted properly" do
 		user = User.new(user_name: "BigMike", email: "bananas")
 		user2 = User.new(user_name: "FrenchJess", email: "johm@example.com")
 		user3 = User.new(user_name: "Taylor", email: "johm@example,com")
 		expect(user).to be_invalid
 		expect(user2).to be_valid
 		expect(user3).to be_invalid
 end
end