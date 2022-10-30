require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    before(:example) { get user_posts_path(1) }

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
    before(:example) { get user_post_path(1, 1) }

    it 'response status was correct' do
      p response.body
      expect(response).to have_http_status :ok
    end

    it 'renders correct template' do
      expect(response).to render_template :show
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'Post'
    end
  end
end
