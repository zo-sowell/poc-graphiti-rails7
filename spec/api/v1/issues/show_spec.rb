require 'rails_helper'

RSpec.describe "issues#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/issues/#{issue.id}", params: params
  end

  describe 'basic fetch' do
    let!(:issue) { create(:issue) }

    it 'works' do
      expect(IssueResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('issues')
      expect(d.id).to eq(issue.id)
    end
  end
end
