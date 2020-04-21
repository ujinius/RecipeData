
require 'rails_helper'

describe 'Navigate' do
  describe 'Recipes list page' do
    it 'can be loaded successfully', :vcr do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'Recipe detail page' do
    it 'can be loaded successfully', :vcr do
      @recipes = RecipeService.new({}).list
      visit static_path(@recipes.first.id)
      expect(page.status_code).to eq(200)
    end

    it 'loaded wrong with wrong ID', :vcr do
      visit static_path('wrongidandsometest')
      expect(page.status_code).to eq(404)
    end
  end
end
