class IngredientsController < ApplicationController
	
   def index
   	  @recipe = Recipe.find(params[:recipe_id])
      render json: @recipe.ingredients
   end
   def create
   	@recipe = Recipe.find(params[:recipe_id])
    render json: @recipe.ingredients.create!(ingredient_params)
   end

   def update
    render json: Ingredient.update(ingredient_params)
   end

   def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.ingredients.destroy_all
   end

   def ingredient_params
   params.require(:ingredient).permit(:name)
   end


end
