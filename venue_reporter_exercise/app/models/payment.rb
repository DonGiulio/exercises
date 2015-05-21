class Payment < ActiveRecord::Base
  belongs_to :user_tab
  
  def venue
    self.user_tab.tab.venue
  end

end
