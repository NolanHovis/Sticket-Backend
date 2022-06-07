class Client < ApplicationRecord
  belongs_to :organization
  validates :name, presence: true
  validates :ticket_identifier, presence: true
end
