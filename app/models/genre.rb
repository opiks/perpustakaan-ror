class Genre < ApplicationRecord
  paginates_per 25
  validates :name, presence: true
end
