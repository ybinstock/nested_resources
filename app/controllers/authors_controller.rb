class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    Author.create(get_author_params)
    redirect_to authors_path
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(get_author_params)
    redirect_to authors_path
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to authors_path
  end

  private
  def get_author_params
    params.require(:author).permit(:name)
  end
end
