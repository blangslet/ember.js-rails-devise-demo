class CreateCompanyMemberships < ActiveRecord::Migration
  def change
    create_table :company_memberships do |t|
      t.integer :user_id
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
