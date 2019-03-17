# frozen_string_literal: true

# Implementation for parser, which extract one purchase and multiple lots
# from two files. Example files: /spec/files/fcsNotificationZP44.xml,
# /spec/files/purchaseNotice_Adygeya_Resp.xml
# Usage:
# p = PurchaseLotsXmlParser.new(
#   File.read('fcsNotificationZP44.xml'),
#   File.read('purchaseNotice_Adygeya_Resp.xml')
# )
# p.parse
# p.attributes
# p.save
# p.create # parse and save
class PurchaseLotsXmlParserV1 < PurchaseLotsXmlParser
  protected

  def extract_purchase
    @purchase = extract_attr(
      0,
      '/ns2:export/ns2:fcsNotificationZP',
      notification_id: 'id',
      purchaseNumber: 'purchaseNumber',
      docPublishDate: 'docPublishDate',
      href: 'href',
      purchaseObjectInfo: 'purchaseObjectInfo'
    ).merge(
      extract_attr(
        1,
        '/ns2:purchaseNotice/ns2:body/ns2:item/ns2:purchaseNoticeData',
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
    )
  end

  def extract_lots
    @lots = extract_collection_attr(
      1,
      '/ns2:purchaseNotice/ns2:body/ns2:item/ns2:purchaseNoticeData/ns2:lots/lot',
      '/',
      guid: 'guid',
      ordinalNumber: 'ordinalNumber',
      subject: 'subject',
      initialSum: 'initialSum',
      deliveryPlace: 'deliveryPlace'
    )
  end
end
