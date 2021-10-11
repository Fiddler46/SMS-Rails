class Team < ApplicationRecord
    validates :name, presence: true
    has_many :messages
    has_many :developer_teams
    has_many :developers, through: :developer_teams
    accepts_nested_attributes_for :developers
end
