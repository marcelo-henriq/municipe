require 'rails_helper'

RSpec.describe Citizen, type: :model do
  context 'model validates' do
    let(:citizen) { create(:citizen, birth_date: 15.year.ago.to_date) }
    before do
      citizen.address = create(:address, citizen_id: citizen.id)
    end

    it 'validate attrs presence' do
      expect(citizen).to be_valid
    end

    it 'validate birth date had included in range' do
      citizen.birth_date = Date.today.end_of_month

      expect(citizen).to be_invalid
    end

    it 'validate if cpf is valid and unique' do
      citizen.cpf = '11111111111'

      citizen.valid?
      expect(citizen.errors[:cpf]).to contain_exactly 'cpf must be valid'
    end

    describe 'validate nested attrs' do
      it { is_expected.to accept_nested_attributes_for(:address) }
    end
  end

end
