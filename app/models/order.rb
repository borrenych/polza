# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_dishes, dependent: :destroy
  has_many :dishes, through: :order_dishes

  validate :must_have_dishes

  DISHES_PER_DAY = 5

  private

  def must_have_dishes
    errors.add(:base, 'An order must have at least one dish') if dishes.empty?
  end
end
