require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  before(:example) do
    @user = User.create(name: 'Donald', email: 'akite27@gmail.com', password: '111111')
    @category = Category.new(author: @user, name: 'Milo', icon: 'https://cdn-icons-png.flaticon.com/512/3311/3311579.png')
  end

  context 'Validations' do
    it 'should have a name' do
      expenditure = Expenditure.new(author: @user, amount: 200, category_ids: [@category.id])
      expect(expenditure.valid?).to eq false
    end

    it 'should have an amount' do
      expenditure = Expenditure.new(author: @user, name: 'Buy sneakers', category_ids: [@category.id])
      expect(expenditure.valid?).to eq false
    end

    it 'should have both a name and an amount' do
      expenditure = Expenditure.new(author: @user, name: 'Buy sneakers', amount: 745, category_ids: [@category.id])
      expect(expenditure.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      expenditure = Expenditure.reflect_on_association('author')
      expect(expenditure.macro).to eq(:belongs_to)
    end
  end
end
