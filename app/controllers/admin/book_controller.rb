class Admin::BookController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
  end

  def add
    @book = Book.new
    @type = Type.all.map { |type| [type.name, type.id] }
    @location = Location.all.map { |type| [type.name, type.id] }
    @genre = Genre.all.map { |type| [type.name, type.id] }
  end

  def store
    params[:book][:book_total_remaining] = params[:book][:book_total]
    @book = Book.new(book_params)
    if @book.save
      params[:book][:genre].each do |i|
        if i != ""
          params[:book_id] = @book.id
          params[:genre_id] = i
          bookcategories = BookCategory.new(book_category_params)
          bookcategories.save
        end
      end
      redirect_to admin_book_index_path, flash: { :message => "Menambah Buku Berhasil", :type => "success" }
    else
      @type = Type.all.map { |type| [type.name, type.id] }
      @location = Location.all.map { |type| [type.name, type.id] }
      @genre = Genre.all.map { |type| [type.name, type.id] }
      render :add
    end
  end

  def book_params
    params.required(:book).permit(:name, :publisher, :writer, :release_date, :page_total, :book_total, :book_total_remaining, :type_id, :location_id, :description, :book_photo)
  end

  def book_category_params
    params.permit(:book_id, :genre_id)
  end
end
