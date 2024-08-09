class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(movie_params)
    redirect_to list_path(@list)
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path
  end

  private

  def movie_params
    params.require(:list).permit(:name)
  end
end
