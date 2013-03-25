module Urbmi5Drupal
  class Organization < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_organization'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode
  end
end
