require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
    let(:user)	{User.new}
    let(:another_user) {User.new}
    let(:bella) {User.new(username:'bella', email:'bella@gmail.com', password:'asdf')}
    let(:keith) {User.new(username:'keith', password:'asdf')}

    describe User do
        it { is_expected.to validate_presence_of(:username) }
        it { is_expected.to validate_presence_of(:email) }
        it { should validate_uniqueness_of(:email) }
        it { should have_many(:bids) }
        it { should have_many(:items) }
        it { should have_many(:authentications) }

        it 'bella shoud be an instance of User' do
            expect(bella).to be_a User
        end

        it "User is not valid without a username" do
            user.email = 'user@gmail.com'
            user.password = 'asdf'
            user.image = 'asdf'
            user.age = 19
            expect(user).not_to be_valid
          end
        end

        it 'User valid eventhough image and age are nil' do
            expect(bella).to be_valid
        end

        it 'User invalid if age is not an integer' do
            bella.age = 'asdf'
            expect(bella).not_to be_valid
        end

        it 'User valid if age is an integer' do
            bella.age = 19
            expect(bella).to be_valid
        end

        it 'User valid if age is nil' do
            bella.age = nil
            expect(bella).to be_valid
        end

        it 'Create with auth and hash requires exactly 2 arguments' do
            expect { User.create_with_auth_and_hash }.to raise_error(ArgumentError)
            expect { User.create_with_auth_and_hash('x') }.to raise_error(ArgumentError)
            expect { User.create_with_auth_and_hash('x', 'y') }.not_to raise_error(ArgumentError)
            expect { User.create_with_auth_and_hash('x','y','z') }.to raise_error(ArgumentError)            
        end

        it 'User email in addresses will fail because they dont follow regex format' do
            user.username = 'username'
            user.password = 'asdf'
            addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                            foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
                user.email = invalid_address
                expect(user).not_to be_valid
            end
        end

        it 'User valid if email format follows regex' do
            user.username = 'username'
            user.email = 'bella@gmail.com'
            user.password = 'asdf'
            expect(user).to be_valid
        end
end