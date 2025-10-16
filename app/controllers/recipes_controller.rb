class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:category).published.default_order
  end

  def show
    @recipe = Recipe.published.find(params.expect(:id))
  end
end
