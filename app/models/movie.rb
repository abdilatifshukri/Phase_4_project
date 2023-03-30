class Movie < ApplicationRecord
    has_many :actors
    has_many :directors
end
