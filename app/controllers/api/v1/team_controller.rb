module Api
  module V1
    module TeamController < Api::V1::ApplicationController
      
        #gets list of teams for the current user
        def get
            @team = current_user.Teams
        end

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

        #creates a new team
        def create
           team = Teams.new 

        end

        #updates a team
        def update
          result = Team.update_team(params[:id], team_params, @current_user)
          payload ={
            team: TeamBlueprinter.render_as_hash(result.payload)
          }
          render_sucess(payload: payload)
        end


     private
        def team_params 
          params.require(:team).permit(:client_id, :organization_id)  
        end

    end
  end
end