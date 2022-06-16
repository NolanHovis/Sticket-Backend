class Status < ApplicationRecord
  belongs_to :organization
  validates :label, :sort_order, presence: true
end
