class EmotionsController < ApplicationController
  def index
    @emotion = Emotion.all
  end

  def new
  end

  def create
  end

end
