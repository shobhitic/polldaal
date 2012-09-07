class Vote < ActiveRecord::Base
  attr_accessible :choice_id
  
  belongs_to :choice
  
end