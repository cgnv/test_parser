# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'purchases/show', type: :view do
  before(:each) do
    @purchase = assign(:purchase, Purchase.create!(
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
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Purchase Number/)
    expect(rendered).to match(/Doc Publish Date/)
    expect(rendered).to match(/Href/)
    expect(rendered).to match(/Purchase Object Info/)
    expect(rendered).to match(/Guid/)
    expect(rendered).to match(/Registration Number/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Purchase Method Code/)
    expect(rendered).to match(/Purchase Code Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Examination Place/)
  end
end
