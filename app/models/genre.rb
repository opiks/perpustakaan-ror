class Genre < ApplicationRecord
  paginates_per 10
  acts_as_paranoid

  validates :name, presence: true
end
