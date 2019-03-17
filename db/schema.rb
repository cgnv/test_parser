# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_190_317_163_231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'lots', force: :cascade do |t|
    t.bigint 'purchase_id'
    t.string 'guid'
    t.integer 'ordinalNumber'
    t.string 'subject'
    t.float 'initialSum'
    t.string 'deliveryPlace'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['purchase_id'], name: 'index_lots_on_purchase_id'
  end

  create_table 'purchases', force: :cascade do |t|
    t.integer 'notification_id'
    t.string 'purchaseNumber'
    t.string 'docPublishDate'
    t.string 'href'
    t.string 'purchaseObjectInfo'
    t.string 'guid'
    t.datetime 'createDateTime'
    t.string 'registrationNumber'
    t.string 'name'
    t.string 'purchaseMethodCode'
    t.string 'purchaseCodeName'
    t.datetime 'publicationDateTime'
    t.string 'status'
    t.string 'version'
    t.datetime 'modificationDate'
    t.integer 'saveUserId'
    t.string 'examinationPlace'
    t.datetime 'examinationDateTime'
    t.datetime 'submissionCloseDateTime'
    t.date 'publicationPlannedDate'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'lots', 'purchases'
end
