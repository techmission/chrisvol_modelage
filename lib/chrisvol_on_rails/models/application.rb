class Application < ActiveRecord::Base
  def opportunity
    Urbmi5Drupal::Opportunity.find_by_nid(self.opportunity_nid)
  end
end