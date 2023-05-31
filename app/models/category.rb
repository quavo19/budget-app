class Category < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :expenditure_categories, dependent: :destroy
    has_many :expenditures, through: :expenditure_categories
    validates :name, presence: true, length: { minimum: 1, maximum: 25 }
    validatable :icon, presence: true
end
