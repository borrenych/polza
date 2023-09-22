# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'GET #new' do
    it 'assigns all ingredients to @ingredients' do
      ingredients = build_list(:ingredient, 3) do |ingredient, index|
        ingredient.name = "Ingredient #{index + 1}"
      end

      ingredients.each(&:save)
      get :new
      expect(assigns(:ingredients)).to eq(ingredients)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { order: { excluded_ingredient_ids: [2] } } }

    context 'with valid params' do
      it 'creates a new order' do
        create(:dish)
        expect do
          post :create, params: valid_params
        end.to change(Order, :count).by(1)
      end

      it 'redirects to the root path with a success notice' do
        create(:dish)
        post :create, params: valid_params
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Order created successfully!')
      end
    end

    context 'when no dishes available' do
      let(:invalid_params) { { order: { excluded_ingredient_ids: [1] } } }

      it 'does not create a new order' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Order, :count)
      end

      it 'redirects to the root path with an error notice' do
        post :create, params: invalid_params
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Something went wrong!')
      end
    end
  end
end
