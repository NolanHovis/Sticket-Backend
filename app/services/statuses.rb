module Statuses

  def self.new_status(params, current_user)
    status = current_user.statuses.new(params)
    return ServiceContract.error("Error saving status") unless status.save
    ServiceContract.success(status)
  end

  def self.update_status(status, params, current_user)
    status = current_user.statuses.find(status_id)
    return ServiceContract.error("Error updating status") unless status.update(params)
    ServiceContract.success(status)
  end

  def self.destroy_status(status_id, current_user)
    status = current_user.statuses.find(status_id)
    ServiceContract.error("Error deleting status") and return unless status.destroy
    ServiceContract.success(payload: nil)
  end
  
end