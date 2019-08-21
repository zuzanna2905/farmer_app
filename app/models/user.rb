class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :fields
  has_many :machines
  has_many :chemicals
  has_many :warehouses
  has_many :employees
  has_many :events
end
