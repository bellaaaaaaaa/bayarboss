require 'rails_helper'
require 'spec_helper'

RSpec.describe Item, type: :model do
    let(:item)	{Item.new}
    let(:another_item) {Item.new(name:'blouse', description:'nice', price:'100', condition:'new', category:'clothing', place:'paris', highprice:'200', status:'open')}

    describe Item do
        it { should have_many(:bids) }
        it { should belong_to(:user) }
        # it { should define_enum_for(:category).
        # with(:art, :beauty, :books, :clothing, :property, :other)}

        it 'item shoud be an instance of Item' do
            expect(item).to be_a Item
        end

        it 'method should require exactly 1 argument' do
            expect { Item.search_items}.to raise_error(ArgumentError)
            expect { Item.search_items('x') }.not_to raise_error(ArgumentError)
            expect { Item.search_items('x', 'y') }.to raise_error(ArgumentError)
        end

        it 'method should return objects with corresponding queries' do
        end
        
    end
end