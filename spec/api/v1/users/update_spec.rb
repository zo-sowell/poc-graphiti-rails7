require 'rails_helper'

RSpec.describe "users#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/users/#{user.id}", payload
  end

  describe 'basic update' do
    let!(:user) { create(:user) }

    let(:payload) do
      {
        data: {
          id: user.id.to_s,
          type: 'users',
          attributes: {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect(UserResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { user.reload.attributes }
    end
  end
end
