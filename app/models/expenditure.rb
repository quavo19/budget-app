class Expenditure < ApplicationRecord
    belongs_to :author, :class_name: 'User'
    has_many :expenditure_categories, dependent: :destroy
    has_many :categories, through: :expenditure_categories
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :user_id, presence: true
end
