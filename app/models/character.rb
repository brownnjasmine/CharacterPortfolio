class Character < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :age, presence: true
end
