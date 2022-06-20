module Team

    def self.new_team(params, current_user)
        team = current_user.teams.new(params)
        return ServiceContract.error("Error creating team!") unless team.save
        ServiceContract.success(team)
      end
    
      def self.update_team(team_id, params, current_user)
        team = current_user.teams.find(team_id)
        return ServiceContract.error("Error updating team!") unless team.update(params)
        ServiceContract.success(team)
      end
    
      def self.destroy_team(team_id, current_user)
        team = current_user.teams.find(team_id)
        ServiceContract.error("Error deleting team!") and return unless team.destroy
        ServiceContract.success(payload: nil)
      end
      
end
