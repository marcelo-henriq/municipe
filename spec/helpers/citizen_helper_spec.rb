require 'rails_helper'

RSpec.describe CitizenHelper, type: :helper do
  describe 'static lists for citizen' do
    it 'returns states array for select box' do
      expect(helper.state_list).to_not be_empty
    end

    it 'Validate states length' do
      expect(helper.state_list.count).to be_positive
      expect(helper.state_list.count).to eq 27
    end
  end

  describe 'city select options for citizen' do
    context 'when city is present' do
      it 'returns citizen selected city' do
        expect(helper.cities_list('Teresina')).to eq [['Teresina', 'Teresina']]
      end
    end

    context 'when city is not present' do
      it 'returns blank option for citizen city' do
        expect(helper.cities_list(nil)).to eq [['', 'Selecione um estado']]
      end
    end
  end
end
