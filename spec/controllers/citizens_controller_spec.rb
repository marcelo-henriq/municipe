require 'rails_helper'

RSpec.describe CitizensController do
  describe 'GET #index' do
    let(:citizens) { create_list(:citizen, 5) }

    before do
      get :index
    end

    it 'validate status' do
      expect(response).to  have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to  render_template(:index)
    end

    it 'validate citizens list' do
      expect(assigns(:citizens)).to match_array(citizens)
    end
  end

  describe 'GET #new' do
    before do
      get :new
    end

    it 'validate status' do
      expect(response).to have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to render_template(:new)
    end

    it 'validate new object' do
      expect(assigns(:citizen)).to be_a_new(Citizen)
    end
  end
end
