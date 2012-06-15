
class StaticPagesController < ApplicationController
  def home
  	@recipe = current_user.recipes.build if signed_in?
  end

  def help
  	@title = "Help"
  end

  def about 
  	@title = "About Us"
  end
end
