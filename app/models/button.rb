# Button
class Button < ActiveRecord::Base
  default_scope { order(area: :asc) }

  AREAS = %w(banner sidebar_item_1 sidebar_item_2).freeze

  validates :link_text, :link_url, presence: true
  validates :area, inclusion: { in: AREAS }, uniqueness: true, presence: true

  scope :displayed, -> { where(display: true) }
end
