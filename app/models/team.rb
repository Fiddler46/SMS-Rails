class Team < ApplicationRecord
    validates :name, presence: true
    has_many :message
    has_many :developer_team
    has_many :developer, through: :developer_team
end
