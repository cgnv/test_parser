# frozen_string_literal: true

json.extract! purchase, :id, :notification_id, :purchaseNumber, :docPublishDate, :href, :purchaseObjectInfo, :guid, :createDateTime, :registrationNumber, :name, :purchaseMethodCode, :purchaseCodeName, :publicationDateTime, :status, :version, :modificationDate, :saveUserId, :examinationPlace, :examinationDateTime, :submissionCloseDateTime, :publicationPlannedDate, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
