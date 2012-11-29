module ChrisvolModelage
  module Urbmi5Drupal
    module Connection
      def self.included(model)
        ChrisvolModelage::db_connect(model, :urbmi5_drupal)
      end
    end
  end
end
