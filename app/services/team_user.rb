module TeamUser

  def self.new_team_user(params, current_user)
    team_user = current_user.team_user.new(params)
    return.ServiceContract.error("Error saving new_team_user") unless team_user.save
    ServiceContract.success(team_user)
  end

  def self.update_team_user(team_user_id, params, current_user)
    team_user = current_user.team_user.find(team_user_id)
    return.ServiceContract.error("Error updating team_user") unless team_user.update
    ServiceContract.success(team_user)
  end

  def self.destroy_team_user(team_user_id, current_user)
    team_user = current_user.team_user.find(team_user_id)
    return.ServiceContract.error("Error deleting user") unless team_user.destroy
    ServiceContract.success(payload:nil)
    end

end
