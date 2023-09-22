# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.boolean :open, null: false, default: true

      t.timestamps
    end
  end
end
