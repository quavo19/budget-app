class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expenditure_category, dependent: :destroy
  has_many :expenditures, through: :expenditure_category
  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
  validates :icon, presence: true
end
