class ProfilePosition < ActiveRecord::Base
  include ChrisvolModelage::ChrisvolOnRails::Connection

  belongs_to :profile
  
  validates_presence_of :title
  
  def start_date_masked
    PartialDate.new(self, :start_date)
  end
  
  def end_date_masked
    PartialDate.new(self, :end_date)
  end
end
