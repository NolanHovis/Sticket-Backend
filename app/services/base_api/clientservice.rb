module BaseAPI
  module ClientServices
    def self.create(params)
      service = Service.new(
        name: params[:name],
        ticket_identifier: params[:ticket_identifier]
        )
      service.save!
      return ServiceContract.error('Error Creating Client Service') unless service.valid?
      ServiceContract.error(service)
    end

    def self.update(service_id,params)
      service = Service.find(service.id)
      
      service.name = params[:name],
      service.ticket_identifier = params[:ticket_identifier]

      service.save!
      return ServiceContract.error('Error Updating Client Service') unless service.valid?
      ServiceContract.error(service)
    end

    def self.delete(service_id)
      service = Service.find(service_id)
      return ServiceContract.error('Error Deleting Service') unless service.destroy

      ServiceContract.success(payload: service)
    end
  end
end
