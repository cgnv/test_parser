# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseLotsXmlParserV1 do
  before(:all) do
    @parser = PurchaseLotsXmlParserV1.new(
      File.read('./spec/files/fcsNotificationZP44.xml'),
      File.read('./spec/files/purchaseNotice_Adygeya_Resp.xml')
    )
  end

  context 'after parse' do
    before(:all) do
      @parser.parse
    end

    it 'return right attributes' do
      expect(@parser.attributes).to be_eql(RIGHT_ATTRIBUTES)
    end

    it 'save purchase and lots' do
      expect { @parser.save }.to(
        change { Purchase.count }.by(1).and(
          change { Lot.count }.by(1)
        )
      )
    end
  end

  it 'create purchase and lots' do
    expect { @parser.create }.to(
      change { Purchase.count }.by(1).and(
        change { Lot.count }.by(1)
      )
    )
  end
end
