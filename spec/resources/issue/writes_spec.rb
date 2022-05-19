require 'rails_helper'

RSpec.describe IssueResource, type: :resource do
  describe 'creating' do
    let!(:user) { create(:user) }
    let(:payload) do
      {
        data: {
          type: 'issues',
          attributes: attributes_for(:issue),
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

    let(:instance) do
      IssueResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Issue.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:user) { create(:user) }
    let!(:issue) { create(:issue) }

    let(:payload) do
      {
        data: {
          id: issue.id.to_s,
          type: 'issues',
          attributes: {
            message: Faker::Lorem.sentence
           }
        }
      }
    end

    let(:instance) do
      IssueResource.find(payload)
    end

    it 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { issue.reload.updated_at }
      # .and change { issue.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:issue) { create(:issue) }

    let(:instance) do
      IssueResource.find(id: issue.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Issue.count }.by(-1)
    end
  end
end
