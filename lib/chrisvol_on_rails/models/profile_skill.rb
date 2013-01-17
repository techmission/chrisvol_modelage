class ProfileSkill < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection
  
  # attr_accessible :title, :body
  belongs_to :profile
  
  validates_presence_of :name
end
