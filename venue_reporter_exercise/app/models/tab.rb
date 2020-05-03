class Tab < ActiveRecord::Base
  belongs_to :venue
  
  has_many :user_tab
  has_many :users, through: :user_tab
end
