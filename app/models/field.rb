class Field < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
  validates :area, presence: true
end
