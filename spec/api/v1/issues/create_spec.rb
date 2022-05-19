require 'rails_helper'

RSpec.describe "issues#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/issues", payload
  end

  describe 'basic create' do
    let!(:user) { create(:user) }
    let(:params) do
      attributes_for(:issue)
    end
    let(:payload) do
      {
        data: {
          type: 'issues',
          attributes: params,
          relationships: {
            user: {
              data: {
                id: user.id.to_s,
                type: 'users'
              }
            }
          }
        }
      }
    end

    it 'works' do
      expect(IssueResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Issue.count }.by(1)
    end
  end
end
