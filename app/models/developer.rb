class Developer < ApplicationRecord
    validates :full_name, presence: true
end
