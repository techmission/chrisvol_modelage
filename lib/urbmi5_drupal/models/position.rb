module Urbmi5Drupal
  class Position < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_volunteer_opportunity'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode
    
    has_many :opportunities_questionnaires, :foreign_key => :opportunity_nid, :primary_key => :nid
    has_many :questionnaires, :through => :opportunities_questionnaires
  end
end
