# frozen_string_literal: true

json.extract! lot, :id, :purchase_id, :guid, :ordinalNumber, :subject, :initialSum, :deliveryPlace, :created_at, :updated_at
json.url lot_url(lot, format: :json)
