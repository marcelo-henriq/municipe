require 'rails_helper'

RSpec.describe CitizenMailer do
  describe 'notify citizen' do
    let(:citizen) { create(:citizen) }
    let(:mail) { described_class.notify_new_citizen(citizen.id).deliver_now }

    it 'validate from' do
      expect(mail.from).to eq ['mhenrique.dev@gmail.com']
    end

    it 'validate to' do
      expect(mail.to).to eq [citizen.email]
    end

    it 'assigns citizen name' do
      expect(mail.body.encoded).to match(citizen.name)
    end
  end
end
