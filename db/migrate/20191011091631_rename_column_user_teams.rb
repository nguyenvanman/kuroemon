class RenameColumnUserTeams < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_teams, :is_invite, :is_invited
  end
end
