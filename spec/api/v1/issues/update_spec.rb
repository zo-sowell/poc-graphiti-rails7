require 'rails_helper'

RSpec.describe "issues#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/issues/#{issue.id}", payload
  end

  describe 'basic update' do
    let!(:issue) { create(:issue) }

    let(:payload) do
      {
        data: {
          id: issue.id.to_s,
          type: 'issues',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(IssueResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { issue.reload.attributes }
    end
  end
end
