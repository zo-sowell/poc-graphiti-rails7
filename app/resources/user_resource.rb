class UserResource < ApplicationResource
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email, :string
  has_many :issues
end
