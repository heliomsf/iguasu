class Place < ApplicationRecord
  has_many :entries, foreign_key: 'placeId'
end
