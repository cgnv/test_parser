# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { is_expected.to respond_to(:lots) }
end
