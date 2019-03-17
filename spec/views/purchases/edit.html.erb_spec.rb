# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'purchases/edit', type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
                                    notification_id: 1,
                                    purchaseNumber: 'MyString',
                                    docPublishDate: 'MyString',
                                    href: 'MyString',
                                    purchaseObjectInfo: 'MyString',
                                    guid: 'MyString',
                                    registrationNumber: 'MyString',
                                    name: 'MyString',
                                    purchaseMethodCode: 'MyString',
                                    purchaseCodeName: 'MyString',
                                    status: 'MyString',
                                    version: 'MyString',
                                    saveUserId: 1,
                                    examinationPlace: 'MyString'
                                  ))
  end

  it 'renders the edit purchase form' do
    render

    assert_select 'form[action=?][method=?]', purchase_path(@purchase), 'post' do
      assert_select 'input[name=?]', 'purchase[notification_id]'

      assert_select 'input[name=?]', 'purchase[purchaseNumber]'

      assert_select 'input[name=?]', 'purchase[docPublishDate]'

      assert_select 'input[name=?]', 'purchase[href]'

      assert_select 'input[name=?]', 'purchase[purchaseObjectInfo]'

      assert_select 'input[name=?]', 'purchase[guid]'

      assert_select 'input[name=?]', 'purchase[registrationNumber]'

      assert_select 'input[name=?]', 'purchase[name]'

      assert_select 'input[name=?]', 'purchase[purchaseMethodCode]'

      assert_select 'input[name=?]', 'purchase[purchaseCodeName]'

      assert_select 'input[name=?]', 'purchase[status]'

      assert_select 'input[name=?]', 'purchase[version]'

      assert_select 'input[name=?]', 'purchase[saveUserId]'

      assert_select 'input[name=?]', 'purchase[examinationPlace]'
    end
  end
end
