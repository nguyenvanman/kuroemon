class UpdateIndexUserTeams < ActiveRecord::Migration[5.2]
  def change
    add_index :user_teams, [:user_id, :team_id], unique: true
  end
end
