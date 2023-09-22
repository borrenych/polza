# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'scopes' do
    describe '.including_ingredients' do
      it 'returns dishes including specified ingredients' do
        ingredient1 = create(:ingredient, name: 'I1')
        ingredient2 = create(:ingredient, name: 'I2')
        dish1 = create(:dish, name: 'Dish1', ingredients: [ingredient1])
        dish2 = create(:dish, name: 'Dish2', ingredients: [ingredient2])

        result = Dish.including_ingredients([ingredient1.id])

        expect(result).to include(dish1)
        expect(result).not_to include(dish2)
      end
    end

    describe '.excluding_ingredients' do
      it 'returns dishes excluding specified ingredients' do
        ingredient1 = create(:ingredient, name: 'I1')
        ingredient2 = create(:ingredient, name: 'I2')
        dish1 = create(:dish, name: 'Dish1', ingredients: [ingredient1])
        dish2 = create(:dish, name: 'Dish2', ingredients: [ingredient2])

        result = Dish.excluding_ingredients([ingredient1.id])

        expect(result).not_to include(dish1)
        expect(result).to include(dish2)
      end
    end

    describe '.daily_dishes' do
      it 'returns a specified number of dishes excluding ingredients' do
        ingredient1 = create(:ingredient, name: 'I1')
        ingredient2 = create(:ingredient, name: 'I2')
        dish1 = create(:dish, name: 'Dish1', ingredients: [ingredient1])
        dish2 = create(:dish, name: 'Dish2', ingredients: [ingredient2])
        create(:dish, name: 'Dish3', ingredients: [ingredient2])
        dishes_number = 2

        result = Dish.daily_dishes([ingredient1.id], dishes_number)

        expect(result.length).to eq(dishes_number)
        expect(result).not_to include(dish1)
        expect(result).to include(dish2)
      end
    end
  end
end
