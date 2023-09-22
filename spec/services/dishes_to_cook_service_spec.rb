# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DishesToCookService, type: :service do
  subject(:service) { described_class }

  describe '#call' do
    context 'when there is orders with dishes ' do
      it 'generates JSON array of dishes sorted by count in descending order' do
        dish1 = create(:dish, name: 'Dish 1')
        dish2 = create(:dish, name: 'Dish 2')
        create(:order, dishes: [dish1, dish1])
        create(:order, dishes: [dish2])

        expect(service.call).to eq([
                                     { name: 'Dish 1', count: 2 },
                                     { name: 'Dish 2', count: 1 }
                                   ])
      end
    end

    context 'when there are no dishes' do
      it 'returns an empty array when there are no dishes' do
        expect(service.call).to eq([])
      end
    end
  end
end
