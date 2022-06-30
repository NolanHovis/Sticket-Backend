module Api
    module V1
    
      class OrganizationController < Api::V1::ApplicationController
        
        def create 
            result = Organization.new_organization(params)
            render_error(errors: 'There was a problem creating a new organization!', status: 400) and return unless result.success?
            payload = {
                user: OrganizationBlueprint.render_as_hash(result.payload, view: :normal)
            }
            render_success(payload: payload) 
        end

        def update
            result = Organization.update_organization(params[:id], client_params, @current_user)
            render_error(errors: 'There was a problem updating a organization!', status: 400) and return unless result.success?
            payload ={
              team: OrganizationBlueprinter.render_as_hash(result.payload)
            }
            render_sucess(payload: payload)
        end

        def destroy 
            result = Organization.destroy_client(params[:id], @current_user)
            render_error(errors: "There was a problem deleting organization", status: 400) and return unless result.success?
            render_success(payload: nil)
        end

        def get    
            @organization = current_user.Organization
        end


        private
        def organization_params 
          params.require(:organization).permit(:name, :subdomain, :orgtype)  
        end

      end
    end      
end    