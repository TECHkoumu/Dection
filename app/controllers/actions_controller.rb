class ActionsController < ApplicationController

  
  def new
    @action = Action.new
    @emotion = Emotion.find(params[:emotion_id])
  end

  def create
    @action = Action.new(action_params)
    @eaction.user = current_user
    if @action.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def emotion_params
    params.require(:action).permit(:plan_example, :plan, :target_score, :current_score, :total_score).merge(user_id: current_user.id, emotion_id: params[:emotion_id])
  end
end
