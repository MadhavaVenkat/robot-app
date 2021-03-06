class Order < ApplicationRecord
    validates :x, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :y, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
    validates :face, presence: true
end
