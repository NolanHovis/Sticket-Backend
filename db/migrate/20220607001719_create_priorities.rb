class CreatePriorities < ActiveRecord::Migration[6.1]
  def change
    create_table :priorities do |t|
      t.string :label
      t.string :string
      t.integer :sort_order
      t.organization :references

      t.timestamps
    end
  end
end
