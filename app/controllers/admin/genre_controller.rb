class Admin::GenreController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
    @genres = Genre.order(:name).page params[:page]

    if params.has_key?(:page)
      perpage = 10;
      page = Integer(params[:page]) 
      @no = (page * perpage) - perpage
    else
      @no = 0
    end
  end

  def add
    @genre = Genre.new
  end

  def store
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genre_index_path, flash: { :message => "Menambah Genre Berhasil", :type => "success" }
    else
      render :add
    end
  end

  private

  def genre_params
    params.required(:genre).permit(:name)
  end
end
