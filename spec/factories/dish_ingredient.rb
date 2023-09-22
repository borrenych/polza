# frozen_string_literal: true

FactoryBot.define do
  factory :dish_ingredient do
    dish
    ingredient
  end
end
