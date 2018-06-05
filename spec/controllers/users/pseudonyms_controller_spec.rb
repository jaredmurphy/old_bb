require "rails_helper"

describe Users::PseudonymsController, type: :controller do 
  before(:each) do 
    FactoryBot.create(:role)
  end

  context "when the user is authenticated" do 
    before(:each) do 
      @user = FactoryBot.create(:user)
      sign_in(@user)
    end

    describe "#index" do 
      it "renders the pseudonyms index page" do 
        get :index, params: { user_id: @user.id }
        assert_response :success
      end
    end

    describe "#create" do 
      before(:each) do 
        new_pseudo = FactoryBot.build(:pseudonym).attributes
        post :create, params: { user_id: @user.id, pseudonym: new_pseudo }
      end

      it "should create the pseudonym" do 
        expect(Pseudonym.count).to eq(2)
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
