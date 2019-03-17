# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'purchases/index', type: :view do
  before(:each) do
    assign(:purchases, [
             Purchase.create!(
               notification_id: 2,
               purchaseNumber: 'Purchase Number',
               docPublishDate: 'Doc Publish Date',
               href: 'Href',
               purchaseObjectInfo: 'Purchase Object Info',
               guid: 'Guid',
               registrationNumber: 'Registration Number',
               name: 'Name',
               purchaseMethodCode: 'Purchase Method Code',
               purchaseCodeName: 'Purchase Code Name',
               status: 'Status',
               version: 'Version',
               saveUserId: 3,
               examinationPlace: 'Examination Place'
             ),
             Purchase.create!(
               notification_id: 2,
               purchaseNumber: 'Purchase Number',
               docPublishDate: 'Doc Publish Date',
               href: 'Href',
               purchaseObjectInfo: 'Purchase Object Info',
               guid: 'Guid',
               registrationNumber: 'Registration Number',
               name: 'Name',
               purchaseMethodCode: 'Purchase Method Code',
               purchaseCodeName: 'Purchase Code Name',
               status: 'Status',
               version: 'Version',
               saveUserId: 3,
               examinationPlace: 'Examination Place'
             )
           ])
  end

  it 'renders a list of purchases' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 'Purchase Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Doc Publish Date'.to_s, count: 2
    assert_select 'tr>td', text: 'Href'.to_s, count: 2
    assert_select 'tr>td', text: 'Purchase Object Info'.to_s, count: 2
    assert_select 'tr>td', text: 'Guid'.to_s, count: 2
    assert_select 'tr>td', text: 'Registration Number'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Purchase Method Code'.to_s, count: 2
    assert_select 'tr>td', text: 'Purchase Code Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Status'.to_s, count: 2
    assert_select 'tr>td', text: 'Version'.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'Examination Place'.to_s, count: 2
  end
end
