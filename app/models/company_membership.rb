class CompanyMembership < ActiveRecord::Base
  attr_accessible :user_id, :company_id, :name
  belongs_to :user
  belongs_to :company
end
