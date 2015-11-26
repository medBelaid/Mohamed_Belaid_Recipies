class RecipesController < ApplicationController
	
	before_action :find_recipe, only: [:show, :edit, :update, :destroy, :upvote]
	
	def index

    # get 10 results par page.
		if params[:mode] == 'p'
      render :json => Recipe.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    
    # get two last user's posts created.  
    elsif params[:mode] == 'f'
      render :json => Recipe.where(user_id: params[:userId]).order('created_at DESC').limit(2)
   
    # get number post's likes. 
    elsif params[:mode] == 't'
      @recipe = Recipe.all.order('created_at DESC')
      respond_to do |format|
        format.json { render json: { total: @recipe.size } }
      end
   
    # get all users.     
    elsif params[:mode] == 'u' 
      render :json => User.all
   
    # get recipe by user
    elsif params[:mode] == 'getUserRecipe' 
      @user = User.find(params[:userId])
      render :json => @user
   
    # get all recipies ordred by date creation. 
    else
        render :json => Recipe.all.order('created_at DESC')
      end
    end

	def show
        render :json => @recipe
	end

	def create
	   render :json => Recipe.create!(recipe_params)
	end

	def update
	   @recipe.update(recipe_params)
	   render :json => @recipe
	end

	def destroy
		result = 'ko'
		begin
		 recipe = Recipe.find(params[:id])
         recipe.destroy
         result = ''	
		rescue Exception => e
			
		end
		render :json => result
      
	end

	def upvote
      @recipe.upvote_by current_user
      respond_to do |format|
      format.html {redirect_to :back }
      format.json { render json: { count: @recipe.get_upvotes.size } }
      end
	end

	def find_recipe
        @recipe = Recipe.find(params[:id])
	end

    def recipe_params
    params.require(:recipe).permit(:title, :content, :user_id, :rate , :image , :userId , ingredients_attributes: [:id, :name, :_destroy])
    end


end
