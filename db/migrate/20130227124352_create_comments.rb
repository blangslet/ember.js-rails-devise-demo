class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :description
      t.boolean :is_active
      t.integer :rank
      t.integer :company_id

      t.timestamps
    end
  end
end
