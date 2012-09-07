class Question < ActiveRecord::Base
  attr_accessible :description, :title, :choices_attributes

  has_many :choices
  has_many :votes, :through => :choices

  accepts_nested_attributes_for :choices, :reject_if => lambda { |choice| choice[:description].blank? }, :allow_destroy => true

end