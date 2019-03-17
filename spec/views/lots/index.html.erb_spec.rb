# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lots/index', type: :view do
  before(:each) do
    assign(:lots, [
             Lot.create!(
               purchase: nil,
               guid: 'Guid',
               ordinalNumber: 2,
               subject: 'Subject',
               initialSum: 3.5,
               deliveryPlace: 'Delivery Place'
             ),
             Lot.create!(
               purchase: nil,
               guid: 'Guid',
               ordinalNumber: 2,
               subject: 'Subject',
               initialSum: 3.5,
               deliveryPlace: 'Delivery Place'
             )
           ])
  end

  it 'renders a list of lots' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Guid'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Subject'.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
    assert_select 'tr>td', text: 'Delivery Place'.to_s, count: 2
  end
end
