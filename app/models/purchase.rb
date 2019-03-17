# frozen_string_literal: true

class Purchase < ApplicationRecord
  has_many :lots
end
