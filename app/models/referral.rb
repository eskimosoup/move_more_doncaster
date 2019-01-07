class Referral
  include ActiveModel::Model

  attr_accessor :title, :name, :address, :date_of_birth, :contact_method_details, :additional_information, :privacy_policy

  validates :title, :name, :address, :date_of_birth, :contact_method_details, presence: true
  validates :privacy_policy, presence: true

  # validate :email_or_telephone

  # def email_or_telephone
  #   errors.add(:email, 'or telephone must be provided') if email.blank? && telephone.blank?
  # end
end
