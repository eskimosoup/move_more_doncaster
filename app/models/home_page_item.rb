# HomePageItem
class HomePageItem < ActiveRecord::Base
  default_scope { positioned }

  COLOURS = %w(purple yellow blue red).freeze

  validates :title, :content, :colour, presence: true
  validates :colour, presence: true, inclusion: { in: COLOURS }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
