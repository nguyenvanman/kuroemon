module TeamService::Update
  def self.call(team, update_team_params)
    team.update_attributes!(update_team_params)
    {
      team: team
    }
  end
end