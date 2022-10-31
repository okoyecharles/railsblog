require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before(:each) do
    @user = User.create(
      name: 'Charles',
      photo: 'https://i.im.ge/2022/10/30/2R6c3h.man.jpg',
      bio: 'Teacher from Nigeria.',
      posts_counter: 0
    )

    @post = Post.create(
      author: @user,
      title: 'Hello',
      text: 'This is my test post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'GET #index' do
    before(:example) { get user_posts_path(@user) }

    it 'response status was correct' do
      expect(response).to have_http_status :ok
    end

    it 'renders correct template' do
      expect(response).to render_template :index
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'Here is a list of posts for a given user:'
    end
  end

  describe 'GET #show' do
    before(:example) { get user_post_path(@user, @post) }

    it 'response status was correct' do
      expect(response).to have_http_status :ok
    end

    it 'renders correct template' do
      expect(response).to render_template :show
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'by'
    end
  end
end
