class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :label
      t.integer :sort_order
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
