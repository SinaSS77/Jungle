require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe '#save' do
    it 'ensures that a product with all four fields set will indeed save successfully' do
      @category = Category.new(name: "Furniture")
      @category.save 

      @product = Product.new(name: "cat", price_cents: 8838, quantity: 45, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it 'should not create a product if a name does not exist' do
      @category = Category.new(name: "Furniture")
      @category.save

      @product = Product.new(name: nil, price_cents: 8838, quantity: 45, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not create a product if a price does not exist' do
      @category = Category.new(name: "Furniture")
      @category.save

      @product = Product.new(name: "cat", price_cents: nil, quantity: 45, category: @category)
      @product.save
      # puts "*****"
      # puts @product.name
      # puts "*****"
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price cents can't be blank")
    end

    it 'should not create a product if a quanity does not exist' do
      @category = Category.new(name: "Furniture")
      @category.save

      @product = Product.new(name: "cat", price: 4546, quantity: nil, category: @category)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not create a product if a quanity does not exist' do
      @category = Category.new(name: "Furniture")
      @category.save

      @product = Product.new(name: "cat", price: 4546, quantity: 78, category: nil)
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    
  end
end