class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :friendly_ticket_id
      t.string :description

      t.timestamps
    end
  end
end
