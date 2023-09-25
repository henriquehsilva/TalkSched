class Track < ApplicationRecord
  validates :name, presence: true
  validates_format_of :name, with: /\A([a-zA-Z\s]{1,})\z/

  has_many :talks, dependent: :destroy

  def as_json(options = {})
    super(options.merge(include: :talks))
  end
end
