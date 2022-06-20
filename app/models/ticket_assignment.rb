class TicketAssignment < ApplicationRecord
  belongs_to :ticket
  belongs_to :team_user
end
