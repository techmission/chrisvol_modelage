class AnswerOption < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :question
  
  validates_presence_of :text
end