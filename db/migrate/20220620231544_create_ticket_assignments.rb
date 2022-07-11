class CreateTicketAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_assignments do |t|
      t.belongs_to :ticket, null: false, foreign_key: true
      t.belomgs :team_user

      t.timestamps
    end
  end
end
