module Api
    module V1
    
      class ActionController < Api::V1::ApplicationController
        
      def get_all_ticket_actions(ticket_id) 
        
        ticket = Ticket.find(ticket_id)

        render_success(payload: ticket.actions.all)

      end


    end      

end    