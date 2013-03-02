class Company < ActiveRecord::Base
  attr_accessible :mission_statement, :name

  has_many :company_memberships
  has_many :posts
  has_many :comments
end
