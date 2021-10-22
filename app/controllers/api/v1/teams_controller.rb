module Api
  module V1
    class TeamsController < ApplicationController
      before_action :set_team, only: [:show, :update, :destroy]
          
        # GET /api/v1/teams
        def index
          @teams = Team.all.map do |team|
          response = team.attributes
          response[:developer_ids] = team.developer_ids
          
          response
          end
          
          render json: @teams
        end
          
        # GET /api/v1/teams/1
        def show
          response = @team.attributes
          response[:developer_ids] = @team.developer_ids
          
          render json: response
        end
          
        # POST /api/v1/teams
        def create
          # dev_ids = plus_params[:dev_ids]
          # @team = Team.new(plus_params.except(:dev_ids))
          @team = Team.new(plus_params)
          # if @team.save
          #   unless dev_ids.nil?
          #   @team.developers << Developer.find(dev_ids)
          #   @team.save!
          #   end
          if @team.save
            render json: @team, status: :created, location: @team
          else
            render json: @team.errors, status: :unprocessable_entity
          end
        end
          
          
        # PATCH/PUT /api/v1/teams/1
        def update
          # dev_ids = team_params[:dev_ids]
          # byebug
          # unless dev_ids.nil?
          #   @team.developer_ids = dev_ids
          #   @team.save!
          # end

          if @team.update(team_params)
            render json: @team
          else
            render json: @team.errors, status: :unprocessable_entity
          end
        end
          
        # DELETE /api/v1/teams/1
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
          params.require(:team).permit(:name, :dept_name, developer_ids: [])
        end
          
        def plus_params
          params.require(:team).permit(:name, :dept_name, developer_ids: [], :developers_attributes => [:full_name, :email, :mobile])
            
        end
      end
    end
  end
          
          
