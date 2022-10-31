require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }

    it 'response status was correct' do
      expect(response).to have_http_status :ok
    end

    it 'renders correct template' do
      expect(response).to render_template :index
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'List of users:'
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path(1) }

    it 'response status was correct' do
      expect(response).to have_http_status :ok
    end

    it 'renders correct template' do
      expect(response).to render_template :show
    end

    it 'response body includes correct placeholder text' do
      expect(response.body).to include 'Information for User'
    end
  end
end
