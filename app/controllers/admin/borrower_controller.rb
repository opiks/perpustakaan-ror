class Admin::BorrowerController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
    @borrowers = Borrower.page params[:page]

    if params.has_key?(:page)
      perpage = 10
      page = Integer(params[:page])
      @no = (page * perpage) - perpage
    else
      @no = 0
    end
  end

  def add
    @borrower = Borrower.new
    @books = Book.all.map { |type| [type.name, type.id] }
    @members = Member.all.map { |type| [type.name, type.id] }
  end

  def store
    @Book = Book.where(:id => params[:borrower][:book_id]).first
    if @Book["book_total_remaining"] >= 1
      @book = Borrower.new(borrower_params)
      if @book.save
        booktotal = @Book["book_total_remaining"] - 1
        Book.where(:id => params[:borrower][:book_id]).update(:book_total_remaining => booktotal)
        redirect_to admin_borrower_index_path, flash: { :message => "Menambah Peminjaman Berhasil", :type => "success" }
      else
        @books = Book.all.map { |type| [type.name, type.id] }
        @members = Member.all.map { |type| [type.name, type.id] }
        render :add
      end
    else
      redirect_to admin_borrower_add_path, flash: { :message => "Total sudah habis", :type => "warning" }
    end
  end

  def return
    @Borrower = Borrower.find(params[:id]) rescue nil
    if !@Borrower.nil?
      @Book = Book.where(:id => @Borrower[:book_id]).first
      booktotal = @Book["book_total_remaining"] + 1
      Book.where(:id => @Borrower[:book_id]).update(:book_total_remaining => booktotal)
      Borrower.where(:id => @Borrower[:id]).update(:statuspengembalian => "Sudah Dikembalikan")
      redirect_to admin_borrower_index_path, flash: { :message => "Pengembalian sukses", :type => "success" }
    else
      redirect_to admin_borrower_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  def borrower_params
    params.required(:borrower).permit(:book_id, :member_id)
  end
end
