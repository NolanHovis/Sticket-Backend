
  module TicketServices
    def self.create(params, current_user)
      ticket = current_user.ticket.new(params)
      return ServiceContract.error('Error Creating Ticket Assignment ') unless ticket.valid?
      ServiceContract.error(ticket)
    end

    def self.update(ticket_id, params, current_user)
      ticket = current_user.ticket.find(ticket_id)
      
     return ServiceContract.error('Error Updating Ticket Assignment') unless ticket.update(params)
      ServiceContract.error(ticket)
    end

    def self.delete(ticket_id,current_user)
      ticket = current_user.ticket.find(ticket_id)
      ServiceContract.error('Error Deleting Ticket Assignment') and return unless ticket.destroy

      ServiceContract.success(payload: nil)
    end
  end

