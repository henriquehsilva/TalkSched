class Talk < ApplicationRecord
  validates :description, presence: true
  validates :duration, presence: true

end
