class Event < ApplicationRecord
  belongs_to :chemical
  belongs_to :employee
  belongs_to :machine
  belongs_to :field
  belongs_to :user
end