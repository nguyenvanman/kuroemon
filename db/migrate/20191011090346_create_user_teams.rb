class CreateUserTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_teams do |t|

      t.timestamps

      t.bigint :user_id
      t.bigint :team_id
      t.boolean :is_owner
      t.boolean :is_invite
      t.boolean :is_activated
    end
  end
end
