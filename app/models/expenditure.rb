class Expenditure < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :expenditure_category, dependent: :destroy
    has_many :category, through: :expenditure_category
    validates :name, presence: true
    validates :amount, presence: true, numericality: { greater_than: 0 }
end
