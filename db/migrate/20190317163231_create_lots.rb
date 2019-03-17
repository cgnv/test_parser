# frozen_string_literal: true

class CreateLots < ActiveRecord::Migration[5.2]
  def change
    create_table :lots do |t|
      t.references :purchase, foreign_key: true
      t.string :guid
      t.integer :ordinalNumber
      t.string :subject
      t.float :initialSum
      t.string :deliveryPlace

      t.timestamps
    end
  end
end
