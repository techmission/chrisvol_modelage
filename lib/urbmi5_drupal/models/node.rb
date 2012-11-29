module Urbmi5Drupal
  class Node < ActiveRecord::Base
    include ChrisvolModelage::Urbmi5Drupal::Connection
    set_table_name "um_node"

     def self.inheritance_column
       nil
     end
  end
end
