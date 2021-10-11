class Developer < ApplicationRecord
    validates :full_name, presence: true
    has_many :developer_teams
    has_many :teams, through: :developer_teams
end
