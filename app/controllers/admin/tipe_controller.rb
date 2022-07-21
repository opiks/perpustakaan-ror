class Admin::TipeController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
    @types = Type.where("name like ?", "%#{params[:search]}%").order(:name).page params[:page]

    if params.has_key?(:page)
      perpage = 10
      page = Integer(params[:page])
      @no = (page * perpage) - perpage
    else
      @no = 0
    end
  end

  def add
    @type = Type.new
  end

  def store
    @type = Type.new(type_params)
    if @type.save
      redirect_to admin_type_index_path, flash: { :message => "Menambah Tipe Berhasil", :type => "success" }
    else
      render :add
    end
  end

  def edit
    @type = Type.find(params[:id]) rescue nil
    if @type.nil?
      redirect_to admin_type_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  def update
    @type = Type.find(params[:id]) rescue nil
    if @type.nil?
      redirect_to admin_type_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end

    if @type.update(type_params)
      redirect_to admin_type_index_path, flash: { :message => "Mengubah Tipe Berhasil", :type => "success" }
    else
      render :edit
    end
  end

  def destroy
    @type = Type.find(params[:id]) rescue nil
    if !@type.nil?
      @type.destroy
      redirect_to admin_type_index_path, flash: { :message => "Menghapus Tipe Berhasil", :type => "success" }
    else
      redirect_to admin_type_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  private

  def type_params
    params.required(:type).permit(:name)
  end
end
