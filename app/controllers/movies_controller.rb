class MoviesController < ApplicationController
  before_action :set_store

  def index
    @movies = @store.movies
    render component: 'Movies', props:{movies: @movies, store: @store}
  end

  def show
    @movie = Movie.find(params[:id])
    render component: 'Movie', props:{movie: @movie, store: @store}
  end

  def new
    @movie = @store.movies.new
    render component: 'MovieNew', props:{store: @store, movie: @movie}
  end

  def create
    @movie = @store.movies.new(movie_params)
    if @movie.save
      redirect_to store_movies_path(@store)
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    render component: 'MovieEdit', props:{store: @store, movie: @movie}
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to store_movies_path(@store)
    else
      render :edit
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to store_movies_path(@store)
  end

  private
  def set_store
    @store = Store.find(params[:store_id])
  end
  
  def movie_params
    params.require(:movie).permit(:title, :duration, :genre)
  end
end