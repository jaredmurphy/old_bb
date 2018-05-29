require "rails_helper"

describe "Posts", type: :controller do 
  before(:each) do 
    @controller = PostsController.new
    FactoryBot.create(:role)
  end

  context "when the user is authenticated" do 
    before(:each) do 
      @user = FactoryBot.create(:user)
      sign_in(@user)
    end

    describe "#index" do 
      it "renders the posts index page" do 
        get :index
        assert_response :success
      end
    end

    describe "#create" do 
      before(:each) do 
        new_post = FactoryBot.build(:post, user: @user)
        post :create, params: { post: new_post.attributes }
      end

      it "should create the post" do 
        expect(Post.count).to eq(1)
      end

      it "should redirect to the new post" do 
        expect(response).to redirect_to(post_path(Post.last.id))
      end
    end
  end

  context "when the user is not authenticated" do 
    before(:each) do 
      user = FactoryBot.create(:user)
      sign_in(nil)
    end

    it "should redirect to the login page for index" do 
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should redirect to the login page for new" do 
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should redirect to the login page for create" do 
      post_params = FactoryBot.build(:post, user: @user).attributes
      post :create, params: { post: post_params }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
