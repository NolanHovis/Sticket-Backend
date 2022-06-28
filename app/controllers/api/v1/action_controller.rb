module Api
    module V1
    
      class ActionController < Api::V1::ApplicationController
        
        def create
            result = Action.new_action(params)
            render_error(errors: 'There was a problem creating a new action!', status: 400) and return unless result.success?
            payload = {
                action: ActionBlueprint.render_as_hash(result.payload, view: :normal)
            }
            render_success(payload: payload)
        end

        def change_status
            action = Action.find(params[:action_id])
            status = Status.find(params[:action_id])

            result = 
        end
    
        def change_priority

        end                 
                              
        def assign
            result = User.assign_user(params[:id], user_params, @current_user)
            render_error(errors: 'There was a problem assigning an action!', status: 400) and return unless result.success?
            payload = {
               action: UserBluePrinter.render_as_hash(results.payload)
            }
            render_sucess(payload: payload)
        end

        private
        def organizaion_params 
          params.require(:action).permit(:comment, :movement, :attachment, :assignment, :priority)  
        end


      end


    end      

end    