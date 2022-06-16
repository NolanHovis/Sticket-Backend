class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :subdomain
      t.integer :org_type

      t.timestamps
    end
  end
end
