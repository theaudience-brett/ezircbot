require 'spec_helper'

describe User do
  describe "check model validations" do
    before :each do
      @baseuser = FactoryGirl.create(:user)
    end
    it "has a valid factory" do
      expect(@baseuser).to be_valid
    end
    it "is invalid without an email address" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end
    it "is invalid with a duplicate email address" do
      expect(FactoryGirl.build(:user, email: @baseuser.email)).to_not be_valid
    end
    it "is invalid with an empty password" do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end
    it "is invalid unless password and password_confirm match" do
      expect(FactoryGirl.build(:user, password_confirm: "mypass")).to_not be_valid
    end
    it "is invalid if password is shorter than 6 characters" do
      expect(FactoryGirl.build(:user, password: "pass", password_confirm: "pass")).to_not be_valid
    end
  end
end
