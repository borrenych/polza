# frozen_string_literal: true

class Dish < ApplicationRecord
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients
  has_many :order_dishes, dependent: :nullify
  has_many :orders, through: :order_dishes

  validates :name, presence: true, uniqueness: true

  scope :including_ingredients, lambda { |ingredient_ids|
    joins(:ingredients).where(ingredients: { id: ingredient_ids }).distinct
  }

  scope :excluding_ingredients, lambda { |ingredient_ids|
    where.not(id: including_ingredients(ingredient_ids))
  }

  scope :daily_dishes, lambda { |ingredient_ids, dishes_number|
    excluding_ingredients(ingredient_ids)
      .order('RANDOM()')
      .limit(dishes_number)
  }
end
