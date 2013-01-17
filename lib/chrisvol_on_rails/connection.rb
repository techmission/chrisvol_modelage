module ChrisvolModelage
  module ChrisvolOnRails
    module Connection
      def self.included(model)
        ChrisvolModelage::db_connect(model, :chrisvol_on_rails)
      end
    end
  end
end
