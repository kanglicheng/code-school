require 'rails_helper'

RSpec.describe User, type: :model do

  subject!(:user) { FactoryBot.create(:user, username: "jessew") }

  describe "password encryption" do

    it "our test" do
      expect(user).not_to be(nil)
    end

    it "does not save passwords to the database" do
      # user
      # User.create!(username: "mary_mack", password: "abcdef")
      user = User.find_by_username("jessew")
      expect(user.password).not_to be("abcdef")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "mary_mack", password: "abcdef")
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:goals) }
  it { should have_many(:cheers_given) }
  it { should have_many(:cheers_received).through(:goals) }
end
