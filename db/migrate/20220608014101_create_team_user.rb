class CreateTeamUser < ActiveRecord::Migration[6.1]
  def change
    create_table :team_user do |t|
      t.integer :role
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

