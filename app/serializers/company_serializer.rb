class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :mission_statement
  has_many :company_memberships
end
