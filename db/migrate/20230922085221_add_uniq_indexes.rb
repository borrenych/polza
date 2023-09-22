# frozen_string_literal: true

class AddUniqIndexes < ActiveRecord::Migration[7.0]
  def change
    add_index :dishes, :name, unique: true, name: 'dishes_uniqueness'
    add_index :ingredients, :name, unique: true, name: 'ingredients_uniqueness'
  end
end
