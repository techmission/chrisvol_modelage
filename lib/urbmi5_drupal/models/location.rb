module Urbmi5Drupal
  class Location < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = "um_location"
  end
end
