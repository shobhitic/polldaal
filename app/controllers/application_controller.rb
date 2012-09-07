class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  
  private
  
  def current_new_question
    Question.find(session[:question_id])
  rescue ActiveRecord::RecordNotFound
    @question = Question.create
    session[:question_id] = @question.id
    @question
  end
  
end
