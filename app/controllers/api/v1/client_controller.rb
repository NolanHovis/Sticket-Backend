module Api
  module V1
    class ClientController < ApplicationController
      def create 
        result = Client.new_client(params)
        render_error(errors: 'There was a problem creating a new client', status: 400) and return unless result.success?
        payload = {
          client: ClientBlueprint.render_as_hash(result.payload, view: :normal)
        }

        render_success(payload: payload)  
      end

      def update 
        result = Client.update_client(params[:id], client_params, @current_user)
        render_error(errors: 'There was a problem updating a client', status: 400) and return unless result.success?
        payload ={
          client: ClientBlueprinter.render_as_hash(result.payload)
        }
        render_sucess(payload: payload)
      end

      def destroy 
        result = Client.destroy_client(params[:id], @current_user)
        render_error(errors: "There was a problem deleting client", status: 400) and return unless result.success?
        render_success(payload: nil)
      end
    end
  end
end
