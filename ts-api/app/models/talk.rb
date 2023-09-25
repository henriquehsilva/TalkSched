class Talk < ApplicationRecord

  belongs_to :track

  validates_presence_of :description, :time, :duration

  scope :ordered, -> { order(time: :asc) }

  def as_json(options = {})
    super(options.merge(include: :track))
  end
end
