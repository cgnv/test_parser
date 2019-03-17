# frozen_string_literal: true

# Basic implementation for parser, which extract one purchase and multiple lots
# from one xml file. Example file: /spec/files/purchase.xml
# Usage:
# p = PurchaseLotsXmlParser.new(File.read('purchase.xml'))
# p.parse
# p.attributes
# p.save
# p.create # parse and save
class PurchaseLotsXmlParser < XmlParser
  def initialize(*sources)
    super
    @purchase = nil
    @lots = nil
  end

  def parse
    @purchase = extract_purchase
    @lots = extract_lots
  end

  def attributes
    @purchase.merge(lot_attributes: @lots)
  end

  def save
    purchase = Purchase.create(@purchase)
    @lots.each do |lot_params|
      purchase.lots.create(lot_params)
    end
  end

  protected

  def extract_purchase
    @purchase = extract_attr(
      0,
      '/ns2:purchase',
      notification_id: 'id',
      purchaseNumber: 'purchaseNumber',
      docPublishDate: 'docPublishDate',
      href: 'href',
      purchaseObjectInfo: 'purchaseObjectInfo',
      guid: 'ns2:guid',
      createDateTime: 'ns2:createDateTime',
      registrationNumber: 'ns2:registrationNumber',
      name: 'ns2:name',
      purchaseMethodCode: 'ns2:purchaseMethodCode',
      purchaseCodeName: 'ns2:purchaseCodeName',
      publicationDateTime: 'ns2:publicationDateTime',
      status: 'ns2:status',
      version: 'ns2:version',
      modificationDate: 'ns2:modificationDate',
      saveUserId: 'ns2:saveUserId',
      examinationPlace: 'ns2:examinationPlace',
      examinationDateTime: 'ns2:examinationDateTime',
      submissionCloseDateTime: 'ns2:submissionCloseDateTime',
      publicationPlannedDate: 'ns2:publicationPlannedDate'
    )
  end

  def extract_lots
    @lots = extract_collection_attr(
      0,
      '/ns2:purchase/ns2:lots/lot',
      '/',
      guid: 'guid',
      ordinalNumber: 'ordinalNumber',
      subject: 'subject',
      initialSum: 'initialSum',
      deliveryPlace: 'deliveryPlace'
    )
  end
end
