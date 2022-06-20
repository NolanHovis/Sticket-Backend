module BaseApi
  module TeamService

    def update_team(team_id, params,current_user)
        team = current_user.team.find(team_id)
        team.update(params)
        ServiceContract.success(team)
    end


    def remove_team(team_id, current_user)
        team = current_user.team.find(team_id)
        team = nil
        ServiceContract.success(team)
    end

    def assign_team(team_id, params, current_user)
        team = team.find(team_id)
        team.update(params)
        ServiceContract.succes(team)
    end
  end
end