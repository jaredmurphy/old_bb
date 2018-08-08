require "rails_helper"

describe Admin::PostsController, type: :controller do
  before(:each) do
    FactoryBot.create(:role)
  end

  context "when the user is an admin" do
    before(:each) do
      @user = FactoryBot.create(:admin_user)
      sign_in(@user)
    end

    describe "#index" do
      it "renders the posts index page" do
        get :index, params: { admin_id: @user.id }
        assert_response :success
      end
    end
  end

  context "when the user is not an admin" do
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in(@user)
    end

    describe "#index" do
      it "redirects to the home page" do
        get :index, admin_id: @user.id
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
