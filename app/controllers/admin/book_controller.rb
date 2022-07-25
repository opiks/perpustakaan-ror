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
    render plain: params
  end

  def book_params
    params.required(:book).permit(:name, :publisher, :writer, :release_date, :page_total, :book_total, :type_id, :location_id, :description)
  end
end
