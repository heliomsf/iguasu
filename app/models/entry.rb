class Entry < ApplicationRecord
  belongs_to :place, foreign_key: 'placeId', class_name: 'Place'

  validates :pdfUrl, presence: true
  validates :placeId, presence: true
end
