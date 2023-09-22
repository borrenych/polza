# frozen_string_literal: true

class CreateOrderDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :order_dishes do |t|
      t.belongs_to :dish, foreign_key: true
      t.belongs_to :order, foreign_key: true

      t.timestamps
    end
  end
end
