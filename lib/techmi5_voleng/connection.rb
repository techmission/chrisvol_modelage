module ChrisvolModelage
  module Techmi5Voleng
    module Connection
      def self.included(model)
        ChrisvolModelage::db_connect(model, :techmi5_voleng)
      end
    end
  end
end