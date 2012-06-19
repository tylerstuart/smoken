class RecipesController < ApplicationController
  before_filter :correct_user, only: [:edit, :update]
  before_filter :signed_in_user, only: [:edit, :update, :destroy, :new, :create]


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
		@recipes = Recipe.paginate(page: params[:page])
	end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:success] = "Recipe Updated"
      redirect_to @recipe
    else
      render 'edit'
    end
  end

    private

    def signed_in_user
      unless signed_in?
        store_location
      redirect_to signin_path, notice: "please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end