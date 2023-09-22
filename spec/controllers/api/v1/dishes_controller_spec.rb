# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::DishesController, type: :controller do
  describe 'GET #index' do
    it 'returns a "OK" status' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    context 'when status OK' do
      it 'returns array of dishes' do
        get :index
        json_response = JSON.parse(response.body)

        expect(json_response).to be_an(Array)
      end
    end
  end
end
