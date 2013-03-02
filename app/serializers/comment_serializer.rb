class CommentSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :description, :is_active, :rank, :company_id
end
