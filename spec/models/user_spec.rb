require 'spec_helper'

describe User do

  before(:each) do
    @attr = {
        :first_name => "Morshed",
        :last_name => "Alam",
        :email => "morshed@nsbench.com",
        :password => "morshed",
        :password_confirmation => "morshed"
    }
  end

  it "should create a new user with valid attributes" do
    User.create!(@attr)
  end

  describe "name validation" do
    it "should require first name" do
      no_email_user = User.new(@attr.merge(:first_name => ""))
      no_email_user.should_not be_valid
    end
  end

  describe "email address validation" do
    it "should require an email address" do
      no_email_user = User.new(@attr.merge(:email => ""))
      no_email_user.should_not be_valid
    end

    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end

    it "should reject duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end

    it "should reject identical email addresses" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
  end

  describe "passwords" do
    before(:each) do
      @user = User.new(@attr)
    end

    it "should have a password attribute" do
      @user.should respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
  end

  describe "password validation" do
    it "should require a password" do
      User.new(@attr.merge(:password => "",
                           :password_confirmation => "")).should_not be_valid
    end

    it "should match password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end

    it "should reject short passwords" do
      short = "a" * 5
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
  end

  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
  end

  describe "roles" do
    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have user role by default" do
      @user.has_role?(:user).should be_true
    end
  end

end
