class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]

  # GET /teams
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  # POST /teams
  def create
    @team = Team.new(plus_params)

    ActiveRecord::Base.transaction do
      # if plus_params.has_key?(:dev_ids)
      #   @team.developer_ids << Developer.find(plus_params.dev_ids)
      # end

      # if plus_params.has_key?(:developer_attributes)
      #   @team.developers << Developer.insert_all(plus_params.developer_attributes)
      # end

      @team.save!
    end

    render json: @team, status: :created, location: @team
  rescue
    render json: @team.errors, status: :unprocessable_entity
  end


  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :dept_name, dev_ids: [])
    end

    def plus_params
      params.require(:team).permit(:name, :dept_name, dev_ids: [], :developers_attributes => [:full_name, :email, :mobile])
    end
end
