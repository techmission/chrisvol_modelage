module Urbmi5Drupal
  class RequiredDocument < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_type_application_documents'
    self.primary_key = 'nid'    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode
    
    belongs_to :position, :class_name => "Urbmi5Drupal::Position", :foreign_key => :field_opp_nid_value, :primary_key => :nid
  end
end
