module Api
  module V1
    class TicketsController < Api::V1::ApplicationController
      

        #creates a new ticket
        def create
          result = Ticket.create_team(params[:id], ticket_params, @current_user)
          render_error(errors: 'Error creating ticket') and return unless result.success?
          payload ={
            ticket: TicketBlueprinter.render_as_hash(result.payload)
          }
          render_sucess(payload: payload)
        end 
        end

        #updates a ticket
        def update
          result = Ticket.update_team(params[:id], ticket_params, @current_user)
          render_error(errors: 'Error updating ticket') and return unless result.success?
          payload ={
            ticket: TicketBlueprinter.render_as_hash(result.payload)
          }
          render_sucess(payload: payload)
        end

        #destroys a ticket
        def destroy
          result = Ticket.destroy_ticket(params[:id], @current_user)
          render_error(errors: 'Error deleting ticket!') and return unless result.success?
          render_sucess(payload: nil)
        end

        #ticket status update
        def change_status
          result = Ticket.destroy_ticket(params[:id], @current_user)
          render_error(errors: 'Error deleting ticket!') and return unless result.success?
          render_sucess(payload: nil)
        end

     private
        def ticket_params 
          params.require(:ticket).permit(:title, :friendly_ticket_id, :description, :archived, :organization_id, :client_id)  
        end

    end
  end
end