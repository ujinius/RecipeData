class StaticController < ApplicationController

  def index
    @recipes = RecipeService.new(list_params).list
  end

  def show
    @recipe = RecipeService.new(item_params).one
    head 404 if @recipe.nil?
  end

  private

  def list_params
    params.permit(:page, :per_page)
  end

  def item_params
    params.permit(:id)
  end

end
