module Chrisvol
  class Uprofile < ActiveRecord::Base
    set_table_name 'um_content_type_uprofile'
    belongs_to :node, :class_name => "Chrisvol::Node", :primary_key => "nid", :foreign_key => "nid"
  end
end
