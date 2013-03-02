class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :company_id, :user_id

  has_many :comments
end
