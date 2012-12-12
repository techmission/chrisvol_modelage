module ChrisvolModelage
  module Urbmi5Drupal
    module ActsAsNode
      def self.included(model)
        model.belongs_to :node, :class_name => "Urbmi5Drupal::Node", :primary_key => "nid", :foreign_key => "nid"
      end

      def user
        n = node
        return nil unless n
        n.user
      end
      # TODO taxonomy stuff

    end
  end
end
