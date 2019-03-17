# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'lots/edit', type: :view do
  before(:each) do
    @lot = assign(:lot, Lot.create!(
                          purchase: nil,
                          guid: 'MyString',
                          ordinalNumber: 1,
                          subject: 'MyString',
                          initialSum: 1.5,
                          deliveryPlace: 'MyString'
                        ))
  end

  it 'renders the edit lot form' do
    render

    assert_select 'form[action=?][method=?]', lot_path(@lot), 'post' do
      assert_select 'input[name=?]', 'lot[purchase_id]'

      assert_select 'input[name=?]', 'lot[guid]'

      assert_select 'input[name=?]', 'lot[ordinalNumber]'

      assert_select 'input[name=?]', 'lot[subject]'

      assert_select 'input[name=?]', 'lot[initialSum]'

      assert_select 'input[name=?]', 'lot[deliveryPlace]'
    end
  end
end
