class CommentsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def new 
    @recipe = current_user.comment.build
  end


  def create
    @recipe = Recipe.find(params[:recipe_id])
  	@comment = @recipe.comments.build(params[:comment])
    @comment.user = current_user
    
    respond_to do |format|
  	  if @comment.save
        format.html {redirect_to(@recipe, :notice => 'Comment was successfully created') }
  	  else
        format.html {redirect_to(@recipe, :notice => 'There was an error saving your comment') }
  	  end
    end
  end

  def destroy
  end
end
