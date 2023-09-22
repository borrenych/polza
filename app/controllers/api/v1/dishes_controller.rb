# frozen_string_literal: true

module Api
  module V1
    class DishesController < ActionController::API
      def index
        render json: DishesToCookService.call.to_json
      end
    end
  end
end
