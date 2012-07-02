
class RatingsController < ApplicationController

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@rating = @recipe.ratings.build(params[:rating])
		@rating.user_id = current_user

		respond_to do |format|
			if @rating.save
				format.html { redirect_to(@recipe, :notice => 'Thank you for rating this recipe!') }
			else
				format.html { redirect_to(@recipe, :notice => 'There was an error saving your rating') }
			end
		end
	end

	def update 
		@rating = current_user.ratings.find(params[:id])
		@recipe = Recipe.find(params[:recipe_id])

		respond_to do |format|
			if @rating.update_attributes(params[:rating])
				format.html { redirect_to(@recipe, :notice => 'Thank you for updating your rating!') }
			else
				format.html { redirect_to(@recipe, :notice => 'There was an error saving your rating.') }
			end
		end
	end

	def destroy
		@rating = current_user.ratings.find(params[:id])
		@recipe = Recipe.find(params[:recipe_id])

		@rating.destroy

		respond_to do |format|
			format.html { respond_to @recipe }
		end
	end
end
