module Techmi5Socgraph
  class Organization < ActiveRecord::Base
    include SafeAttributes::Base
    include ChrisvolModelage::Techmi5Socgraph::Connection
    self.table_name = 'tbl_organizations'
  end
end
