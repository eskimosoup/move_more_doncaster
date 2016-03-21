# AdditionalContent
class AdditionalContent < ActiveRecord::Base
  default_scope { order(title: :asc) }

  AREAS = %w(banner_text opening_hours contact_form referral_form).freeze

  validates :title, :content, presence: true
  validates :area, inclusion: { in: AREAS }, uniqueness: true, presence: true

  scope :displayed, -> { where(display: true) }
end
