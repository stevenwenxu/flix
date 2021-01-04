class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		# https://api.rubyonrails.org/classes/ActionController/Parameters.html#method-i-permit
		@movie.update(movie_params)
		redirect_to @movie
	end

	def new
		@movie = Movie.new
	end

	def create
		new_movie = Movie.new(movie_params)
		new_movie.save
		redirect_to new_movie
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
	end
end