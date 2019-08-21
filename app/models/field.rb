class Field < ApplicationRecord
  belongs_to :user
  has_many :events
  validates :number, presence: true
  validates :area, presence: true

  def is_own?
    if self.ownership
      'tak'
    else
      'nie'
    end
  end
end
