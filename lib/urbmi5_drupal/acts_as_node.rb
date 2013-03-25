module ChrisvolModelage
  module Urbmi5Drupal
    module ActsAsNode
      def self.included(model)
        model.belongs_to :node, :class_name => "Urbmi5Drupal::Node", :primary_key => "nid", :foreign_key => "nid"
        model.after_save do
          node = self.node        
          node.set_changed_timestamp
          node.save
        end
      end

      # Delegations to node...

      def user
        n = node
        return nil unless n
        n.user
      end

    end
  end
end
