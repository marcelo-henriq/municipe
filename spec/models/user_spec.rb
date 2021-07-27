require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it 'validate attrs' do
    expect(user).to  be_valid
  end

  it 'validate create object' do
    expect { user.save }.to change(described_class, :count)
  end
end
