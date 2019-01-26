require "rails_helper"

describe Users::PseudonymsController, type: :controller do
  context "when the user is authenticated" do
    let(:user) { FactoryBot.create(:user) }

    before { sign_in(user) }

    describe "#index" do
      it "renders the pseudonyms index page" do
        get :index, params: { user_id: user.id }
        assert_response :success
      end
    end

    describe "#create" do
      let(:new_pseudo) { FactoryBot.build(:pseudonym).attributes }
      let!(:pseudo_count) { Pseudonym.count }
      before { post :create, params: { user_id: user.id, pseudonym: new_pseudo }}

      it "should create the pseudonym" do
        expect(Pseudonym.count).to be > pseudo_count
      end

      it "should redirect to the root path" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context "when the user is not authenticated" do
    before(:each) do
      @user = FactoryBot.create(:user)
      sign_in(nil)
    end

    it "should redirect to the login page" do
      get :index, params: { user_id: @user.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
