class Action < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :label, :sort_order, presence: true
  validates :metadata, :sort_order, presence: true
  validates :action_type, :sort_order, presence: true
  
end
