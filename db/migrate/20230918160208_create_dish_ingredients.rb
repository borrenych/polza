# frozen_string_literal: true

class CreateDishIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :dish_ingredients do |t|
      t.belongs_to :dish, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
