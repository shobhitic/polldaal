class PollsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end
end
