class Team < ApplicationRecord
  belongs_to :client
  belongs_to :organization
  enum role: Enumerable::TeamRoles.options, _prefix: :teamroles
end
