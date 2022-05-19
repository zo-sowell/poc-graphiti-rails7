require 'rails_helper'

RSpec.describe "issues#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/issues/#{issue.id}"
  end

  describe 'basic destroy' do
    let!(:issue) { create(:issue) }

    it 'updates the resource' do
      expect(IssueResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Issue.count }.by(-1)
      expect { issue.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
