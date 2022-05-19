require 'rails_helper'

RSpec.describe IssueResource, type: :resource do
  describe 'serialization' do
    let!(:issue) { create(:issue) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(issue.id)
      expect(data.jsonapi_type).to eq('issues')
    end
  end

  describe 'filtering' do
    let!(:issue1) { create(:issue) }
    let!(:issue2) { create(:issue) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: issue2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([issue2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:issue1) { create(:issue) }
      let!(:issue2) { create(:issue) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            issue1.id,
            issue2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            issue2.id,
            issue1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
