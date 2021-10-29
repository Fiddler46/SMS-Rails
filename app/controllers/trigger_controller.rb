class TriggerController < ApplicationController
    require 'securerandom'
    def notification
        @message = Message.new(message_params)
        @mob = Team.find(params[:team_id]).developers.pluck(:mobile)
        @mail = Team.find(params[:team_id]).developers.pluck(:email)
        tim = Time.now

        if @message.save
          respond_to do |format|
            format.json { render json: { 'Response' => {:team_id => @message.team_id, 
                'sms' => { "id" => SecureRandom.uuid, "mobile" => @mob, :content => @message.content, "sent_at" => tim }, 
                'email' => { "id" => SecureRandom.uuid, "email" => @mail, :title => @message.title, :content => @message.content, "sent_at" => tim } } } }
          end
        else
            render json: @message.errors, status: :unprocessable_entity
        end

    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.permit(:team_id, :title, :content)
    end
end




