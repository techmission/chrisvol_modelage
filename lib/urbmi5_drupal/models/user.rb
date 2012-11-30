module Urbmi5Drupal
  class User < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    set_table_name 'um_users'

    def uprofile
      uprofile_node = Node.find(:first, :conditions => "type = 'uprofile' and uid  = '#{self.id}'")
      return nil unless uprofile_node      
      Urbmi5Drupal::Uprofile.find_by_nid(uprofile_node.nid)
    end
  end
end
