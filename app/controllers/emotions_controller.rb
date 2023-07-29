class EmotionsController < ApplicationController
  def index
    @emotion = Emotion.all
  end

  def new
    @emotion = Emotion.new
  end

  def create
    @emotion = Emotion.new(emotion_params)
    @emotion.user = current_user
    if @emotion.save
      redirect_to new_action_path(emotion_id: @emotion.id)
    else
      render :new
    end
  end

  private
  def emotion_params
    params.require(:emotion).permit(:event_occurred, :specific_details, :unpleasant_index, :category_id).merge(user_id: current_user.id)
  end
end
