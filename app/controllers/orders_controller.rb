# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @ingredients = Ingredient.all
  end

  def create
    order = Order.new
    order.dishes = Dish.daily_dishes(order_creation_params, Order::DISHES_PER_DAY)
    return redirect_to root_path, notice: 'Order created successfully!' if order.save

    redirect_to root_path, notice: 'Something went wrong!'
  end

  private

  def order_creation_params
    params.require(:order).permit(excluded_ingredient_ids: [])
  end
end
