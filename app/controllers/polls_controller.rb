class PollsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @user = current_user
    if @user
      if @user.votes.where(:question => @question)
        @has_given_vote = true
      end
    end
  end

  def index
    @questions = Question.limit(1)
  end
end
