class CompanyMembershipSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :company_id
end
