class RecipesController < ApplicationController
  before_filter :signed_in_user

  def create
  	@recipe = current_user.recipes.build(params[:recipe])
  	if @recipe.save
  		flash[:success] = "Recipe Created"
  		redirect_to root_path
  	else
  		render 'static_pages/home'
  	end
  end

  def new 
  	@recipe = Recipe.new
  end

  def destroy
  end

	def show
#		@recipe = @user.recipes.paginate(page: params[:page])
        @recipe = Recipe.find(params[:id])
	end

	def index 
		@recipe = Recipe.paginate(page: params[:page])
	end
end