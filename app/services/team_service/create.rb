module TeamService::Create
  def self.call(user, team_params)
    team = user.teams.create!(team_params)
    UserTeam.where(user: user, team: team).update_all(is_owner: true)
    {
      team: team
    }
  end
end