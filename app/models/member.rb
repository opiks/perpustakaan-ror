class Member < ApplicationRecord
  paginates_per 10
  acts_as_paranoid

  validates :nik, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  mount_uploader :photo, MemberPhotoUploader
end
