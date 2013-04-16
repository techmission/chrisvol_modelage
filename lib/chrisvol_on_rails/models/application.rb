class Application < ActiveRecord::Base
  def opportunity
    Urbmi5Drupal::Position.find_by_nid(self.opportunity_nid)
  end
end