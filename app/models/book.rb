class Book < ApplicationRecord
  paginates_per 10
  acts_as_paranoid

  has_many :book_categories

  validates :location_id, presence: true
  validates :type_id, presence: true
  validates :name, presence: true
  validates :book_total, presence: true
  validates :book_total_remaining, presence: true
  mount_uploader :bookphoto, MemberPhotoUploader
end
