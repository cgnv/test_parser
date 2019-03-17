# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :notification_id
      t.string :purchaseNumber
      t.string :docPublishDate
      t.string :href
      t.string :purchaseObjectInfo
      t.string :guid
      t.datetime :createDateTime
      t.string :registrationNumber
      t.string :name
      t.string :purchaseMethodCode
      t.string :purchaseCodeName
      t.datetime :publicationDateTime
      t.string :status
      t.string :version
      t.datetime :modificationDate
      t.integer :saveUserId
      t.string :examinationPlace
      t.datetime :examinationDateTime
      t.datetime :submissionCloseDateTime
      t.date :publicationPlannedDate

      t.timestamps
    end
  end
end
