module Urbmi5Drupal
  class OrganizationOwner < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection

    self.table_name = 'um_content_field_volorg_owner'
    self.primary_keys = [:nid, :field_volorg_owner_uid]    

    include ChrisvolModelage::Urbmi5Drupal::ActsAsNode
    
    belongs_to :user, :class_name => "Urbmi5Drupal::User", :foreign_key => "field_volorg_owner_uid", :primary_key => "uid"
    belongs_to :organization, :class_name => "Urbmi5Drupal::Organization", :foreign_key => "nid", :primary_key => "nid"
  end
end