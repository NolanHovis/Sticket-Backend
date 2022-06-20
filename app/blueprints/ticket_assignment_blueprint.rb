# frozen_string_literal: true

# Defines the JSON blueprint for the TicketAssignment model
class TicketAssignmentBlueprint < Blueprinter::Base
    identifier :id
    fields :title, :friendly_ticket_id, :archived, :organization_id, :client_id, :priority_id, :user_id, :created_at, :updated_at, :client_id, :organization_id, :priority_id, :user_id
  
    view :normal do
        fields :title, :friendly_ticket_id, :archived, :organization_id, :client_id, :priority_id, :user_id, :created_at, :updated_at, :client_id, :organization_id, :priority_id, :user_id
    end
end