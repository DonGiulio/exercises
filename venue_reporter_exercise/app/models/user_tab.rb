class UserTab < ActiveRecord::Base
  belongs_to :tab
  belongs_to :user

  has_many :payments

  delegate :venue, to: :tab
end
