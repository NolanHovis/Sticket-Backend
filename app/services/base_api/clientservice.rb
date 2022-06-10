module BaseAPI
  module ClientServices
    def self.create(params, current_user)
      service = current_user.service.new(param)
      return ServiceContract.error('Error Creating Client Service') unless service.valid?
      ServiceContract.error(service)
    end

    def self.update(service_id,params, current_user)
      service = current_user.service.find(service_id)
      
     return ServiceContract.error('Error Updating Client Service') unless service.update(params)
      ServiceContract.error(service)
    end

    def self.delete(service_id,current_user)
      service = current_user.service.find(service_id)
      ServiceContract.error('Error Deleting Service') and return unless service.destroy

      ServiceContract.success(payload: nil)
    end
  end
end
