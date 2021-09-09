class RecipesController < ApplicationController
  before_action :set_recipe!, only: %i[show edit update]

  def show
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build[:id => '0']
    @recipe.ingredients.build[:id => '1']
  end

  def create
    @recipe = Recipe.create(recipe_params)
      if @recipe.save
        redirect_to @recipe
      end
  end

  def edit    
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipes_path 
  end

  private

  def set_recipe!
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end
