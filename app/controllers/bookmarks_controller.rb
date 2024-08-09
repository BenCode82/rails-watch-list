class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    @bookmark.movie_id = params[:bookmark][:movie_id]
    @bookmark.list_id = params[:list_id]


    if @bookmark.save!
      redirect_to list_path(params[:list_id])
    else
      render 'new'
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    @list = List.find(@bookmark.list_id)
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
