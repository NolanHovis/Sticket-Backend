class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :friendly_ticket_id
      t.string :description
      t.references :organization, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :priority, null: false, foreign_key: true

      t.timestamps
    end
  end
end
