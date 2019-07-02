require "rails_helper"

describe PostsController, type: :controller do
  context "when the user is authenticated" do
    let(:user) { FactoryBot.create(:user) }
    let(:existing_post) { FactoryBot.create(:post, user: user) }

    describe "#show" do
      it "renders the posts show page" do
        sign_in(user)
        get :show, params: { id: existing_post.id }
        assert_response :success
      end
    end

    describe "#create" do
      context "when the user is a publisher" do
        let(:publisher_user) { FactoryBot.create(:publisher_user) }
        let(:new_post) { FactoryBot.build(:post, user: publisher_user) }

        before(:each) do
          sign_in(publisher_user)
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
  end

  context "when the user is not authenticated" do
    let(:user) { FactoryBot.create(:user) }

    before(:each) do
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
      post_params = FactoryBot.build(:post, user: user).attributes
      post :create, params: { post: post_params }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
