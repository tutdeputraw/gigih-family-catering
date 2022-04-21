require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe 'associations' do
    it { should have_many(:menu_categories).class_name('MenuCategory') }
    it { should have_many(:item_categories).class_name('ItemCategory') }
    it { should have_many(:order_items).class_name('OrderItem') }
    it { should have_many(:orders).class_name('Order') }
  end

  it 'is invalid with a duplicate name' do
    menu1 = MenuItem.create(name: "Nasi Uduk", description: 'asdasdadasdasdas', price: 10000.0)
    menu2 = MenuItem.new(name: "Nasi Uduk", description: 'asdasdadasdasdas', price: 10000.0)

    menu1.valid?
    menu2.valid?

    expect(menu2.errors[:name]).to include("has already been taken")
  end
end