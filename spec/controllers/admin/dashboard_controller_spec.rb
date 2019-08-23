require "rails_helper"

describe Admin::DashboardController do
  context "when the user is an admin" do
    let(:user) { FactoryBot.create(:admin_user) }
    before { sign_in(user) }

    describe "GET#index" do
      it "responds with a 200" do
        get :index, params: { admin_id: user.id }
        expect(response).to be_success
      end
    end
  end

  context "when the user is not an admin" do
    let(:user) { FactoryBot.create(:user) }
    before { sign_in(user) }

    describe "#index" do
      it "redirects to the home page" do
        get :index, params: { admin_id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
