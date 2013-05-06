class TextAnswer < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :question
end