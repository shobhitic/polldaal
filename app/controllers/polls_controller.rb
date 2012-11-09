class PollsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @user = current_user
    if @user
      @question.choices.each do |choice|
        @vote = @user.votes.where(:choice_id => choice)
        if  @vote = @vote.first
          logger.info(@vote.id.to_s + "\n" + @vote.choice_id.to_s + "\n" + @vote.user_id.to_s)
        break
        end
      end
    end
  end

  def index
    @questions = Question.all
  end
end
