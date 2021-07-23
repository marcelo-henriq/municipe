require 'rails_helper'

RSpec.describe CitizenDecorator do
  let(:citizen) { build(:citizen, birth_date: '1999-10-27'.to_date, phonenumber: '86998054534', cns: '715961102532430', cpf: '61798803364').decorate }

  it 'returns pretty birh date' do
    expect(citizen.birth_date_localized).to eq citizen.birth_date.strftime('%d/%m/%Y')
  end

  it 'returns pretty CPF' do
    expect(citizen.pretty_cpf).to eq '617.988.033-64'
  end

  it 'returns pretty CNS' do
    expect(citizen.pretty_cns).to eq '715 9611 0253 24-30'
  end

  it 'returns pretty phonenumber' do
    expect(citizen.pretty_phonenumber).to eq '+55 (86)99805-4534'
  end

  it 'returns pretty address' do
    expect(citizen.pretty_address).to eq "#{citizen.address.neighborhood}, #{citizen.address.residencial_number} | #{citizen.address.city}."
  end

  it 'returns enum of citizen statuses' do
    expect(citizen.statuses).to eq [['Ativo', 'active'], ['Inativo', 'inactive']]
  end

  it 'returns citizen age' do
    expect(citizen.age).to eq 21
  end
end
