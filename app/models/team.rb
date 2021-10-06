class Team < ApplicationRecord
    validates :name, presence: true
    has_many :message
    has_many :developer_team
    has_many :developer, through: :developer_team
    accepts_nested_attributes_for :developer
end
