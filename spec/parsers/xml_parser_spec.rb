# frozen_string_literal: true

require 'rails_helper'

RSpec.describe XmlParser do
  subject { XmlParser.new }
  it { expect { subject.parse }.to raise_error(NotImplementedError) }
  it { expect { subject.attributes }.to raise_error(NotImplementedError) }
  it { expect { subject.save }.to raise_error(NotImplementedError) }
  it { expect { subject.create }.to raise_error(NotImplementedError) }
end
