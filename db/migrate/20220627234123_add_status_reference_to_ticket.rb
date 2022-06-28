class AddStatusReferenceToTicket < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :status, foreign_key: true
  end
end
