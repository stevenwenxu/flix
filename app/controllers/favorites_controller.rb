class FavoritesController < ApplicationController
    before_action :require_signin
    def create
        movie = Movie.find(params[:movie_id])
        movie.fans << current_user
        redirect_to movie
    end

    def destroy
        movie = Movie.find(params[:movie_id])
        # fav = movie.favorites.find(params[:id])
        fav = Favorite.find(params[:id])
        fav.destroy
        redirect_to movie
    end
end
