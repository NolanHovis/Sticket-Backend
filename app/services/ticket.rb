module Ticket

    def self.new_ticket(params, current_user)
        ticket = current_user.tickets.new(params)
        return ServiceContract.error("Error creating ticket!") unless ticket.save
        ServiceContract.success(ticket)
      end
    
      def self.update_ticket(ticket_id, params, current_user)
        ticket = current_user.tickets.find(ticket_id)
        return ServiceContract.error("Error updating ticket!") unless ticket.update(params)
        ServiceContract.success(ticket)
      end
    
      def self.destroy_ticket(ticket_id, current_user)
        ticket = current_user.tickets.find(ticket_id)
        ServiceContract.error("Error deleting ticket!") and return unless ticket.destroy
        ServiceContract.success(payload: nil)
      end
      
end