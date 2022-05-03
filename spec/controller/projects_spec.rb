require 'rails_helper'
require_relative '../utils/all_utils'

describe ProjectsController, type: :controller do
  user_login
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context 'GET #show' do
    let!(:project) { Project.create(title: 'Test title', abstract: "Test abstract", description: 'Test description') }
    it 'returns a success response' do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end
end