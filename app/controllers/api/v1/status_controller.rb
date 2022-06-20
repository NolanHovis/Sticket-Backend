module Api
  module V1

    def create_status
      status = current_user.Statuses.new(params)
      Statuses.save  
    end

    def update_status
      status = current_user.statuses.find(organization_id)
      status.update(params)
      payload ={
        status: StatusBlueprinter.render_as_hash(results.payload)
      }
      render_success(payload: payload)
    end

    def delete_status
      status = current_user.Statuses.find(organization_id)
      status.destroy
      render_success(payload: nil)
    end

    def list_status
      @status = current_user.Statuses(organization_id)

    end








  end
end