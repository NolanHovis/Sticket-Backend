
  module ClientServices
    def self.create(params, current_user)
      client = current_user.client.new(params)
      return ServiceContract.error('Error Creating Client Service') unless client.valid?
      ServiceContract.error(client)
    end

    def self.update(client_id, params, current_user)
      client = current_user.client.find(client_id)
      
     return ServiceContract.error('Error Updating Client Service') unless client.update(params)
      ServiceContract.error(client)
    end

    def self.delete(client_id,current_user)
      client = current_user.client.find(client_id)
      ServiceContract.error('Error Deleting Client') and return unless client.destroy

      ServiceContract.success(payload: nil)
    end
  end

