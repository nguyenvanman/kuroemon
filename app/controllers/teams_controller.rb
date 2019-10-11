class TeamsController < ApplicationController
  def create
    render_resource TeamService::Create.call(@current_user, team_params)
  end

  def team_params
    params.require(%i[name is_private])
    params.permit(:name, :description, :is_private)
  end
end
