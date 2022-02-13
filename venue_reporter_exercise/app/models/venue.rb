# frozen_string_literal: true

class Venue < ActiveRecord::Base
  has_many :tabs
end
