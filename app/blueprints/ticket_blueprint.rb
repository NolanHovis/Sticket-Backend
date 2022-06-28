# frozen_string_literal: true

# Defines the JSON blueprint for the Ticket model
class TicketBlueprint < Blueprinter::Base
  identifier :id
  fields :
      
  view :full_ticket do
    fields :title, :friendly_ticket_id, :description, :archived, :organiztion_id, :client_id, :priority_id, :user_id, 
    :created_at, :updated_at
  end

  view :card do
    fields :friendly_ticket_id, :user_id, :status_id
  end

end
  
  