# frozen_string_literal: true

class Payment < ActiveRecord::Base
  belongs_to :user_tab

  delegate :venue, to: :user_tab
end
