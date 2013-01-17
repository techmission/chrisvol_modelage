class ProfilePublication < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :profile
  
  validates_presence_of :title
end
