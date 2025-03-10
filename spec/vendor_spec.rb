require './lib/item'
require './lib/vendor'
require 'pry'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price:"$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@vendor).to be_a(Vendor)
    end
  end

  describe'#attributes' do
    it 'has a name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")      
    end

    it 'starts with no inventory' do
      expect(@vendor.inventory).to eq({})      
    end

    it 'can check stock of items' do
      @vendor.stock(@item1, 0)
        expect(@vendor.check_stock(@item1)).to eq(0)
    end
    
    it 'can add to the stock of items' do
      @vendor.stock(@item1, 30)
        expect(@vendor.check_stock(@item1)).to eq(30)
      
      @vendor.stock(@item1, 25)
        expect(@vendor.check_stock(@item1)).to eq(55)

      @vendor.stock(@item2, 12)  
        expect(@vendor.check_stock(@item2)).to eq(12)

        expect(@vendor.inventory).to eq({@item1 => 55, @item2 => 12})
    end
  end
end