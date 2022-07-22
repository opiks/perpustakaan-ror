class Admin::MemberController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
    @members = Member.where("name like ?", "%#{params[:search]}%").order(:name).page params[:page]

    if params.has_key?(:page)
      perpage = 10
      page = Integer(params[:page])
      @no = (page * perpage) - perpage
    else
      @no = 0
    end
  end

  def add
    @member = Member.new
  end

  def store
    @member = Member.new(member_params)
    if @member.save
      redirect_to admin_member_index_path, flash: { :message => "Menambah Member Berhasil", :type => "success" }
    else
      render :add
    end
  end

  def edit
    @member = Member.find(params[:id]) rescue nil
    if @member.nil?
      redirect_to admin_member_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
    @member.photo.cache!
  end

  def update
    @member = Member.find(params[:id]) rescue nil
    if @member.nil?
      redirect_to admin_member_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end

    if @member.update(member_params)
      redirect_to admin_member_index_path, flash: { :message => "Mengubah Member Berhasil", :type => "success" }
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id]) rescue nil
    if !@member.nil?
      @member.remove_photo!
      @member.save
      @member.destroy
      redirect_to admin_member_index_path, flash: { :message => "Menghapus Member Berhasil", :type => "success" }
    else
      redirect_to admin_member_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  def member_params
    params.required(:member).permit(:nik, :name, :email, :phone, :gender, :address, :photo)
  end
end
