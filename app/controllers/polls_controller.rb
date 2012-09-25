class PollsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @user = current_user
    if @user
      @question.votes.each do |vote|
        if @user == vote.user
          respond_to do |format|
            format.html { redirect_to @question, :notice => "You\'ve already voted, faggot!" }
          end
          return
        end
      end
    end
  end

  def index
    @questions = Question.all
  end
end
