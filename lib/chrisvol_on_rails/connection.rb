module ChrisvolModelage
  module ChrisvolOnRails
    module Connection
      def self.included(model)
        ChrisvolModelage::db_connect(model, nil)
      end
    end
  end
end
