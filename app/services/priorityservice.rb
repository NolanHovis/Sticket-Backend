
  module PriorityServices
    def self.create(params, current_user)
     priority = current_user.priority.new(params)
      return ServiceContract.error('Error Creating Priority Assignment ') unless priority.valid?
      ServiceContract.error(priority)
    end

    def self.update(priority_id, params, current_user)
     priority = current_user.priority.find(priority_id)
      
     return ServiceContract.error('Error Updating Priority Assignment') unless priority.update(params)
      ServiceContract.error(priority)
    end

    def self.delete(priority_id,current_user)
     priority = current_user.priority.find(priority_id)
      ServiceContract.error('Error Deleting Priority Assignment') and return unless priority.destroy

      ServiceContract.success(payload: nil)
    end
  end

