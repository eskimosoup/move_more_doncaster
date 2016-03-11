class Contact
  include ActiveModel::Model
  attr_accessor :forename, :surname, :email, :message
  validates :forename, :surname, :email, :message, presence: true
end
