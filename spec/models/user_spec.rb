require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validate create object' do
    expect { create(:user) }.to change(described_class, :count)
  end
end
