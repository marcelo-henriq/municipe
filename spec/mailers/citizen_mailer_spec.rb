require 'rails_helper'

RSpec.describe CitizenMailer do
  describe 'validate mailer citizen' do
    let(:citizen) { create(:citizen) }

    context 'notify new citizen' do
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

    context 'notify update citizen' do
      let(:mail) { described_class.notify_update_citizen(citizen.id).deliver_now }
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
end
