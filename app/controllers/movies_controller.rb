class MoviesController < ApplicationController
  def index
    @movies = Movies.all
    render component: 'Movies' , props: { movies: @movies }
  end

  def show
    @Mmovie = Movie.find(param[:id])
    render component: 'Movie', props: { movies: @movies }
  end

  def new
    @movie = Movie.new
    render component: 'MovieNew' , props: { movie: @movie } 
  end

  def edit
    @movie =  Movie.find(params[:id])
    render component: 'MovieEdit' , props { movie: @movie }
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      #
    else
      render component: 'MovieNew', props: { movie: @movie }
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.upate(movie_params)
      # do something
    else
      render component: 'MovieEdit', props: {movie: @movie }
    end
  end

  private 

  def  movie_params
    params.require(:movie).permit(:title, :genre, :duration)
  end
end
