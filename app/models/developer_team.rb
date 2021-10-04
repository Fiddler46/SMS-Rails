class DeveloperTeam < ApplicationRecord
    belongs_to :team
    belongs_to :developer
end
