# frozen_string_literal: true

class DishesToCookService
  def self.call
    dishes_counts = OrderDish.group(:dish_id).count
    dishes = Dish.where(id: dishes_counts.keys).pluck(:name, :id)

    # Create an array of hashes with dish names and counts
    dishes_to_cook = dishes.map do |dish_name, dish_id|
      { name: dish_name, count: dishes_counts[dish_id] }
    end

    dishes_to_cook.sort_by { |dish| -dish[:count] }
  end
end
