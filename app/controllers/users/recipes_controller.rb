class Users::RecipesController < Users::ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes.includes(:category).default_order
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
  end

  def edit
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      redirect_to users_recipe_path(@recipe), notice: 'レシピを作成しました'
    else
      render :new, status: :unprocessable_content
    end
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to users_recipe_path(@recipe), notice: 'レシピを更新しました', status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    if @recipe.destroy
      redirect_to users_recipes_path, notice: 'レシピを削除しました', status: :see_other
    else
      redirect_to users_recipes_path, alert: @recipe.errors.full_messages.join(', ')
    end
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params.expect(:id))
  end

  def recipe_params
    params.expect(recipe: %i[title description cooking_time difficulty category_id published])
  end
end
