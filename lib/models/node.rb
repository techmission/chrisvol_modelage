module Chrisvol
  class Node < ActiveRecord::Base
    set_table_name "um_node"

    def self.inheritance_column
      nil
    end
  end
end
