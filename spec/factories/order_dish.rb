# frozen_string_literal: true

FactoryBot.define do
  factory :order_dish do
    order
    dish
  end
end
