require 'rails_helper'

RSpec.describe CitizensController do
  describe 'GET #index' do
    let(:citizens) { create_list(:citizen, 5) }

    before { get :index }

    it 'validate status' do
      expect(response).to  have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to  render_template(:index)
    end

    it 'validate citizens list' do
      expect(assigns(:citizens).filtered_citizens).to eq citizens
    end
  end

  describe 'GET #new' do
    before { get :new }

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

  describe 'POST #create' do
    let(:citizen_params) { attributes_for(:citizen, birth_date: '2001-06-06'.to_date) }
    let(:address_params) { attributes_for(:address) }

    context 'When citizen have valid params', aggregate_failures: true do
      it 'validate create object' do
        expect{
          post :create, params: { citizen: citizen_params.merge!(address_attributes: address_params) }
        }.to change(Citizen, :count)
      end

      it 'validate status' do
        post :create, params: { citizen: citizen_params.merge!(address_attributes: address_params) }

        expect(response).to have_http_status(302)
        expect(response).to redirect_to citizens_path
        expect(flash[:notice]).to eq 'Incluido com sucesso!'
      end
    end

    context 'When citizen have invalid params' do
      it 'validate create object' do
        expect{
          post :create, params: { citizen: { name: 'Marcelo henrique', birth_date: Date.tomorrow}.merge!(address_attributes: address_params) }
        }.to_not change(Citizen, :count)
      end
    end
  end

  describe 'GET #edit' do
    let(:citizen) { create(:citizen) }

    before { get :edit, params: { id: citizen.id } }

    it 'validate status' do
      expect(response).to have_http_status(:success)
    end

    it 'validate render template' do
      expect(response).to render_template(:edit)
    end

    it 'validate object' do
      expect(assigns(:citizen)).to eql citizen
    end
  end

  describe 'PUT/PACTH #update' do
    let(:citizen) {create(:citizen)}
    
    context 'when citizen have valid params', aggregate_failures: true do
      let(:citizen_params) { attributes_for(:citizen, name: 'Marcelo Henrique', birth_date: '1999-10-27'.to_date ) }
      it 'validate update object' do
        put :update, params: { id: citizen.id, citizen: citizen_params }

        expect(citizen.reload.name).to eq 'Marcelo Henrique'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to citizens_path
        expect(flash[:notice]).to eq 'Atualizado com sucesso!'
      end
    end

    context 'when citizen do not have valid params' do
      let(:citizen_params) { attributes_for(:citizen, name: '', cpf: '' ) }
      it 'validate update object' do
        put :update, params: { id: citizen.id, citizen: citizen_params }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
