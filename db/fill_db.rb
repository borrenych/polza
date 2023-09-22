# frozen_string_literal: true

require 'yaml'

# Load the YAML file
file_path = File.join(Rails.root, 'db/menu.yml')
yaml_data = YAML.load_file(file_path)

# Create ingredients
yaml_data['ingredients'].each do |ingredient_name|
  Ingredient.find_or_create_by!(name: ingredient_name)
end

# Create dishes and their associated dish_ingredients
yaml_data['dishes'].each do |dish_data|
  dish_name = dish_data['name']
  dish_ingredients = dish_data['ingredients']

  dish = Dish.find_or_create_by!(name: dish_name)

  dish_ingredients.each do |ingredient_name|
    ingredient = Ingredient.find_by(name: ingredient_name)

    if ingredient
      DishIngredient.find_or_create_by!(dish:, ingredient:)
    else
      puts "Warning: Ingredient '#{ingredient_name}' not found and not added to '#{dish_name}'."
    end
  end
end
