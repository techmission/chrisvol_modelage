class SelectAnswer < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :option, :class_name => "AnswerOption"
  def text
    option.text
  end
end