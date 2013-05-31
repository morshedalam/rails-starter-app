require 'spec_helper'

describe UsersController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "Index" do
    describe "as an admin" do
      before do
        @user.add_role(:admin)
      end

      it "should be successful" do
        get 'index'
        response.should be_success
      end
    end

    describe "as an user" do
      it "should not be successful" do
        get 'index'
        response.should_not be_success
      end
    end
  end

  describe "Show" do
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
  end

  describe "Destroy" do
    before do
      @another_user = FactoryGirl.create(:another_user)
    end

    describe "as an admin" do
      before do
        @user.add_role(:admin)
      end

      it "should not be able to delete itself" do
        expect { delete :destroy, :id => @user.id }.not_to change(User, :count)
      end

      it "should be able to delete another user" do
        expect { delete :destroy, :id => @another_user.id }.to change(User, :count)
      end
    end

    describe "as an user" do
      it "should not be able to delete user" do
        delete 'destroy', :id => @another_user.id
        response.should_not be_success
      end
    end
  end

  describe "Change Role" do
    describe "as an admin" do
      before do
        @user.add_role(:admin)
      end

      it "should be able to update role" do
        @another_user = FactoryGirl.create(:another_user)
        put :update, :id => @another_user.id, :user => @attr
        response.should_not be_success
      end
    end

    describe "as an user" do
      it "should not be successful" do
        put :update, :id => @user.id, :user => @attr
        response.should_not be_success
      end
    end
  end
end
