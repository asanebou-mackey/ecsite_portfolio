require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "validation" do
    it 'is valid with a valid email and password' do
      expect(user).to be_valid
    end
  end
end
