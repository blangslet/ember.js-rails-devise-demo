class Comment < ActiveRecord::Base
  attr_accessible :description, :is_active, :post_id, :rank, :company_id
  belongs_to :post
end
