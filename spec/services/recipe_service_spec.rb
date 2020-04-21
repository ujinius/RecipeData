
require 'rails_helper'

describe RecipeService do
  it 'exist' do
    service = RecipeService.new({})

    expect(service).to be_a(RecipeService)
  end

  it 'gets recipes list', :vcr do
    items = RecipeService.new({}).list

    expect(items.size).to be > 0
  end

  it 'gets one recipe', :vcr do
    items = RecipeService.new({}).list
    one_item = RecipeService.new({ id: items.first.id }).one

    expect(one_item.title.blank?).to be false
  end

  it 'gets one wrong recipe' do
    VCR.use_cassette(
      'RecipeService/gets_one_wrong_recipe',
      record: :new_episodes
    ) do
      one_item = RecipeService.new({ id: "wrong_recipe_id_#{Time.now.to_i}" }).one

      expect(one_item.nil?).to be true
    end
  end
end