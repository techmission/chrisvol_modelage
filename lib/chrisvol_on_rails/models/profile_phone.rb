class ProfilePhone < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection
  belongs_to :profile
  validates_presence_of :phone_number
end
