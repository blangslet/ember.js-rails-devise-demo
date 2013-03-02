class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end
  end
end
