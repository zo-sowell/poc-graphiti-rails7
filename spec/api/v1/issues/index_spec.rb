require 'rails_helper'

RSpec.describe "issues#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/issues", params: params
  end

  describe 'basic fetch' do
    let!(:issue1) { create(:issue) }
    let!(:issue2) { create(:issue) }

    it 'works' do
      expect(IssueResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['issues'])
      expect(d.map(&:id)).to match_array([issue1.id, issue2.id])
    end
  end
end
