# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lots/show', type: :view do
  before(:each) do
    @lot = assign(:lot, Lot.create!(
                          purchase: nil,
                          guid: 'Guid',
                          ordinalNumber: 2,
                          subject: 'Subject',
                          initialSum: 3.5,
                          deliveryPlace: 'Delivery Place'
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Guid/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/Delivery Place/)
  end
end
