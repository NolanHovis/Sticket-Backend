module Api
    module V1
  
      def create_priority
        priority = current_user.Priorities.new(params)
        Priorities.save  
      end
  
      def update_priority
        priority = current_user.priorities.find(organization_id)
        priority.update(params)
        payload ={
          priority: PriorityBlueprinter.render_as_hash(results.payload)
        }
        render_success(payload: payload)
      end
  
      def delete_priority
        priority = current_user.Priorities.find(organization_id)
        priority.destroy
        render_success(payload: nil)
      end
  
      def list_priority
        @priority = current_user.Priorities(organization_id)
  
      end
  
  
    end
  end