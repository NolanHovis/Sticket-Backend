class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :ticket_identifier
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
