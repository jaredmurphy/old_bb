require "rails_helper"

describe "Home", type: :controller do 
  before(:each) do 
    @controller = HomeController.new
    FactoryBot.create(:role)
  end

  describe "#index" do 
    it "renders the posts index page" do 
      get :index
      assert_response :success
    end
  end
end

