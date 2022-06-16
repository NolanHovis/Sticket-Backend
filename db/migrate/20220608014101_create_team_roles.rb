class CreateTeamRoles < ActiveRecord::Migration[6.1]
  class CreateTeamRoles < ActiveRecord::Migration[6.1]
    def change
      create_table :teamroles do |t|
        t.integer :role
        t.reference :team
  
        t.timestamps
      end
    end
  end
end
