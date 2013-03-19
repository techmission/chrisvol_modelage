module ChrisvolModelage
  module Techmi5Socgraph
    module Connection
      def self.included(model)
        ChrisvolModelage::db_connect(model, :techmi5_socgraph)
      end
    end
  end
end
