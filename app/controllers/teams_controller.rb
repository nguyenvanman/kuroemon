class TeamsController < ApplicationController
  before_action :get_team, only: %i[update]

  def create
    render_resource TeamService::Create.call(@current_user, team_params)
  end

  def update
    render_resource TeamService::Update.call(@team, update_team_params)
  end

  def team_params
    params.require(%i[name description is_private image_url])
    params.permit(:name, :description, :is_privatem, :image_url)
  end

  def update_team_params
    params.require(%i[image_url description])
    params.permit(:image_url, :description)
  end

  def get_team
    @team = @current_user.teams.find(params[:id])
  end
end
