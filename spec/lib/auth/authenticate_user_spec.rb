require 'rails_helper'

RSpec.describe AuthenticateUser do
  let(:user) {create(:user) }
  let(:invalid_auth_object) { described_class.new('username', 'password') }
  let(:valid_auth_object) { described_class.new(user.username, user.password) }
  describe '#call ' do
    context 'when valid credentials' do
      it 'returns an auth token' do
        token = valid_auth_object.call
        expect(token).not_to be_nil
      end
    end
    context 'when invalid credentials' do
      it 'returns nil' do
        token = invalid_auth_object.call
        expect(token).to be_nil
      end
    end
  end
end
