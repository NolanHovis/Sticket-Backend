module Action

    def self.create(ticket_id, user_id, action_type, label, metadata,)
      
        
      action = Action.create!(ticket_id: ticket_id, user_id: user_id, action_type: action_type,
          label: label, metadata: metadata)

      action

        
      
    end
      
    
end








#      def self.update_action(action_id, params, current_user)
#        action = current_user.actions.find(action_id)
#         return ServiceContract.error("Error updating action!") unless action.update(params)
#        ServiceContract.success(action)
#      end
    
#      def self.destroy_action(action_id, current_user)
#        action = current_user.actions.find(action_id)
#        ServiceContract.error("Error deleting action!") and return unless action.destroy
#        ServiceContract.success(payload: nil)
#      end