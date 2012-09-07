class Choice < ActiveRecord::Base
  attr_accessible :description, :question_id
  
  belongs_to :question
  has_many :votes
  
end
