module Urbmi5Drupal
  class User < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    self.table_name = 'um_users'
    self.primary_key = 'uid'

	  validates :name, :presence => true, :uniqueness => true
	  validates_presence_of :mail
	
    has_many :organization_owners, :class_name => "Urbmi5Drupal::OrganizationOwner", :primary_key => "uid", :foreign_key => "field_volorg_owner_uid"
    has_many :organizations, :through => :organization_owners
  
    def uprofile
      uprofile_node = Node.find(:first, :conditions => "type = 'uprofile' and uid  = '#{self.id}'")
      return nil unless uprofile_node      
      Urbmi5Drupal::Uprofile.find_by_nid(uprofile_node.nid)
    end
  end
end
