class Admin::LokasiController < ApplicationController
  before_action :check_user_login
  layout "admin"

  def index
    @locations = Location.where("name like ?", "%#{params[:search]}%").order(:name).page params[:page]

    if params.has_key?(:page)
      perpage = 10
      page = Integer(params[:page])
      @no = (page * perpage) - perpage
    else
      @no = 0
    end
  end

  def add
    @location = Location.new
  end

  def store
    @location = Location.new(location_params)
    if @location.save
      redirect_to admin_location_index_path, flash: { :message => "Menambah Lokasi Berhasil", :type => "success" }
    else
      render :add
    end
  end

  def edit
    @location = Location.find(params[:id]) rescue nil
    if @location.nil?
      redirect_to admin_location_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  def update
    @location = Location.find(params[:id]) rescue nil
    if @location.nil?
      redirect_to admin_location_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end

    if @location.update(location_params)
      redirect_to admin_location_index_path, flash: { :message => "Mengubah Lokasi Berhasil", :type => "success" }
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id]) rescue nil
    if !@location.nil?
      @location.destroy
      redirect_to admin_location_index_path, flash: { :message => "Menghapus Lokasi Berhasil", :type => "success" }
    else
      redirect_to admin_location_index_path, flash: { :message => "Data Tidak ditemukan", :type => "warning" }
    end
  end

  private

  def location_params
    params.required(:location).permit(:name)
  end
end
