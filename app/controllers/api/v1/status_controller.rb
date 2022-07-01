module Api
  module V1

    class StatusController < Api::V1::ApplicationController

    def create
      status = current_user.Statuses.new(params)
      Statuses.save  
    end

    def update
      status = current_user.statuses.find(organization_id)
      status.update(params)
      payload ={
        status: StatusBlueprinter.render_as_hash(results.payload)
      }
      render_success(payload: payload)
    end

    def delete
      status = current_user.Statuses.find(organization_id)
      status.destroy
      render_success(payload: nil)
    end

    def list
      @status = current_user.Statuses(organization_id)

    end

    private
    def status_params 
      params.require(:status).permit( :label, :sort_order, :organization_id, :created_at, :updated_at,)  
    end






  end
end