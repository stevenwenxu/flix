class FavoritesController < ApplicationController
    before_action :require_signin

    def create
        movie = Movie.find_by!(slug: params[:movie_id])
        movie.fans << current_user
        redirect_to movie
    end

    def destroy
        movie = Movie.find_by!(slug: params[:movie_id])
        # NOT Favourite.find(params[:id]) because it would allow any signed in user to make request to delete other user's favorites
        fav = current_user.favorites.find(params[:id])
        fav.destroy
        redirect_to movie
    end
end
