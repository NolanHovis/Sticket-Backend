module Api
  module V1
    class TicketsController < Api::V1::ApplicationController
      

        #creates a new ticket
        def create
           ticket = Ticket.new 
        end

        #updates a ticket
        def update
          result = Ticket.update_team(params[:id], ticket_params, @current_user)
          payload ={
            ticket: TicketBlueprinter.render_as_hash(result.payload)
          }
          render_sucess(payload: payload)
        end


     private
        def ticket_params 
          params.require(:ticket).permit(:title, :friendly_ticket_id, :description, :archived, :organization_id, :client_id,
            :priority_id, :user_id, :created_at, :updated_at, :organization_id)  
        end

    end
  end
end