class Organization < ApplicationRecord

    enum role: Enumerable::Organization.options, _prefix: :organization
end
