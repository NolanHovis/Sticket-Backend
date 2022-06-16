module Action

    def self.new_action(params, current_user)
        action = current_user.actions.new(params)
        return ServiceContract.error("Error saving action!") unless action.save
        ServiceContract.success(action)
      end
    
      def self.update_action(action_id, params, current_user)
        action = current_user.actions.find(action_id)
        return ServiceContract.error("Error updating action!") unless action.update(params)
        ServiceContract.success(action)
      end
    
      def self.destroy_action(action_id, current_user)
        action = current_user.actions.find(action_id)
        ServiceContract.error("Error deleting action!") and return unless action.destroy
        ServiceContract.success(payload: nil)
      end
      
end