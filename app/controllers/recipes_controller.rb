class RecipesController < ApplicationController
  before_filter :recipe_creater, only: [:edit, :update]
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
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments.paginate(page: params[:page])
    @comment = current_user.comments.build if signed_in?

    if signed_in?
      @rating_currentuser = @recipe.ratings.find_by_user_id(current_user.id)
      unless @rating_currentuser 
        @rating_currentuser = current_user.ratings.new
      end
    end
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
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

     def recipe_creater
      @recipe = Recipe.find(params[:id])
      redirect_to(recipe_path) unless recipe_creator?(@recipe)
     end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end