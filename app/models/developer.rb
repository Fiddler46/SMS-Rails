class Developer < ApplicationRecord
    validates :full_name, presence: true
    has_many :developer_team
    has_many :developer, through: :developer_team
end
