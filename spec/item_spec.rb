require './lib/item'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price:"$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end
  end

  describe'#attributes' do
    it 'has a name' do
      expect(@item1.name).to eq('Peach')
      expect(@item2.name).to eq('Tomato')
    end

    it 'has a price' do
      expect(@item1.price).to eq(0.75)
      expect(@item2.price).to eq(0.5)
    end
  end  
end