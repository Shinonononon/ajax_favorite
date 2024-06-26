class FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    current_user.favorites.create(blog_id: @blog.id)
    respond_to do |format|
        format.js { render 'index' }
        #current_user.favorites.create(blog_id: params[:blog_id])
        #favorite = current_user.favorites(blog_id: params[:blog_id])
        #favorite.save
      end
    end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @blog = @favorite.blog
    @favorite.destroy
    respond_to do |format|
    format.js { render 'index' }
    #current_user.favorites.find_by(id: params[:id]).destroy
    #favorite = Favorite.find_by(id: params[:id])
    #favorite.destroy
  end
end

end
