module Api
  module V1
    class ActionsController < Api::V1::ApplicationController

      def create
        action = @current_user.actions.new(action_params)
        return render_error(errors: "Error saving action") unless action.save
        
        res = Actions.new_action(action_params, @current_user)
        render_error(errors: "There was a problem creating a new action", status: 400)

        payload = {
          action: ActionBlueprint.render_as_hash(res.payload)
        }
        render_success(payload: payload)
      end

      def update_status
        # need to update ticket.status
      end

      def update_priority
        # need to update ticket.priority
      end

      def assign_user
        # need to assign a user to ticket
      end

      private 
        def action_params
          params.require(:action).permit(:ticket, :user)
        end
    end
  end
end