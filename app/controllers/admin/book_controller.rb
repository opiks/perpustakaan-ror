class Admin::BookController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
    @books = Book.where("name like ?", "%#{params[:search]}%").order(:name).page params[:page]

    if params.has_key?(:page)
      perpage = 10
      page = Integer(params[:page])
      @no = (page * perpage) - perpage
    else
      @no = 0
    end
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

  def edit
    @book = Book.find(params[:id]) rescue nil
    if @book.nil?
      redirect_to admin_book_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
    @book.bookphoto.cache!
    @type = Type.all.map { |type| [type.name, type.id] }
    @location = Location.all.map { |type| [type.name, type.id] }
    @genre = Genre.all.map { |type| [type.name, type.id] }
  end

  def update
    @book = Book.find(params[:id]) rescue nil
    if @book.nil?
      redirect_to admin_book_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end

    if @book.update(book_params)
      BookCategory.where(:book_id => params[:id]).destroy_all
      params[:book][:genre].each do |i|
        if i != ""
          params[:book_id] = params[:id]
          params[:genre_id] = i
          bookcategories = BookCategory.new(book_category_params)
          bookcategories.save
        end
      end
      redirect_to admin_book_index_path, flash: { :message => "Mengubah Buku Berhasil", :type => "success" }
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id]) rescue nil
    if !@book.nil?
      @book.remove_bookphoto!
      @book.save
      @book.destroy
      BookCategory.where(:book_id => params[:id]).destroy_all
      redirect_to admin_book_index_path, flash: { :message => "Menghapus Buku Berhasil", :type => "success" }
    else
      redirect_to admin_book_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  def book_params
    params.required(:book).permit(:name, :publisher, :writer, :release_date, :page_total, :book_total, :book_total_remaining, :type_id, :location_id, :description, :bookphoto)
  end

  def book_category_params
    params.permit(:book_id, :genre_id)
  end
end
