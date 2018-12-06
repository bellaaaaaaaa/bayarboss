require 'rails_helper'
require 'spec_helper'

RSpec.describe Item, type: :model do
    let(:item)	{Item.new}
    let(:item1)	{Item.new(user_id:1, name:'shirt', price:'abc', description:'comfy', condition:'new', category:'clothing', place:'london', highprice:100)}
    let(:another_item) {Item.new(name:'blouse', description:'nice', price:100, condition:'new', category:'clothing', place:'paris', highprice:200, status:'open')}
    let(:improper_category) {'asdf'} 
    let(:x){10}
    let(:y){50}

    context 'validation:' do
        it { should have_many(:bids) }
        it { should belong_to(:user) }
        it {should have_db_column(:price).of_type(:integer)}
        it {should have_db_column(:highprice).of_type(:integer)}
    end

    context 'search_items' do
        it 'method should require exactly 1 argument' do
            expect { Item.search_items}.to raise_error(ArgumentError)
            expect { Item.search_items('x') }.not_to raise_error
            expect { Item.search_items('x', 'y') }.to raise_error(ArgumentError)
        end
    end
    
    context 'creates:' do
        it 'item shoud be an instance of Item' do
            expect(Item.new).to be_a Item
        end
        
        it 'Item can only use specified enum values for category' do 
            expect{item.category='asdf'}.to raise_error(ArgumentError)
            expect{item.category='beauty'}.not_to raise_error
        end
        
        it "price has to be an integer" do
            item1.price = 10
            expect(item1).to be_valid
        end

        it 'price as a string is invalid' do
            item1.price = 'ten'
            expect(item1).not_to be_valid
        end
        
        it 'highprice has to be greater than price' do
            item.user_id = 1
            item.price = x
            item.highprice = y
            expect(item).to be_valid
        end

        it 'price cannot be greater than highprice' do
            item.user_id = 1
            item.price = y
            item.highprice = x
            expect(item).not_to be_valid
        end

    end
        
    context 'self.search_items' do
        it 'returns items where name is like query' do
            Item.create(name: 'x', description: 'x', price: 10, condition: 'new', category: 'art', user_id: 1, place: 'paris', highprice: 20, status: "open")
            expect(Item.search_items('y').count).to eq 0
        end

        it 'returns items where name is like query' do
            Item.create(name: 'potato', description: 'x', price: 10, condition: 'new', category: 'art', user_id: 1, place: 'paris', highprice: 20, status: "open")
            expect(Item.search_items('potato').count).to eq 1
        end
    end
end