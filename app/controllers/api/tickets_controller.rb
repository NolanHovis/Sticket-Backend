module Api
  module V1
    module TeamController < Api::V1::ApplicationController
      
        #removed team from current user 
        def remove
          result = Team.remove_team(params[:id],team_params, @current_user)
          payload = {
            team: TeamBlueprinter.render_as_hash(results.payload)
          }
          render_sucess(payload: payload)
        end  
            

        end

        #assigns a new team to the user
        def assign
          result = Team.assign_team(params[:id], team_params, @current_user)
          payload = {
            team: TeamBluePrinter.render_as_hash(results.payload)
          }
          render_sucess(payload: payload)
        end

        #creates a new ticket
        def create
           ticket = Ticket.new 

        end

        #updates a ticket
        def update
          result = Ticket.update_team(params[:id], ticket_params, @current_user)
          payload ={
            team: TicketBlueprinter.render_as_hash(result.payload)
          }
          render_sucess(payload: payload)
        end


     private
        def ticket_params 
          params.require(:ticket).permit(:client_id, :organization_id)  
        end

    end
  end
end