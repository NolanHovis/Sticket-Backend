module Api
    module V1
        class PriorityController < Api::V1::ApplicationController
            def create
                result = Priority.new_priority(params)
                render_error(errors: 'There was a problem creating a new priority', status: 400) and return unless result.success?
                payload = {
                  Priority: PriorityBlueprint.render_as_hash(result.payload, view: :normal)
            }
    
            render_success(payload: payload)  
          end
    
          def update 
            result = Priority.update_priority(params[:id], priority_params, @current_user)
            render_error(errors: 'There was a problem updating a priority', status: 400) and return unless result.success?
            payload ={
              priority: PriorityBlueprinter.render_as_hash(result.payload)
            }
            render_sucess(payload: payload)
          end
    
          def destroy 
            result = Priority.destroy_priority(params[:id], @current_user)
            render_error(errors: "There was a problem deleting priority", status: 400) and return unless result.success?
            render_success(payload: nil)
           
            def list
              @priority = current_user.Priorities(organization_id)
            
              private
              def organizaion_params 
                params.priority(:organization).permit(:label, :sort_order, :organization)  
              end
            end
        end
      end
    end 