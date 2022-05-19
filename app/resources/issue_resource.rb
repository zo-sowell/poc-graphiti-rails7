class IssueResource < ApplicationResource
  attribute :message, :string
  attribute :is_done, :boolean
  belongs_to :user
  filter :user_id, :integer
end
