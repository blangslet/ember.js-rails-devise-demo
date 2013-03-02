class Post < ActiveRecord::Base
  attr_accessible :body, :title, :company_id, :user_id
  has_many :comments
  belongs_to :company
  belongs_to :user
end
