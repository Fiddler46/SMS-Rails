class Message < ApplicationRecord
    validates :title, presence: true
    belongs_to :team
end
