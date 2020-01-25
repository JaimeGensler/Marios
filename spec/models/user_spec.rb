require 'rails_helper'

describe User, :model do
    context '(associations)' do
        it { should have_many :reviews }
    end

    context '(validations)' do
        it { should validate_presence_of :username }
        it { should validate_uniqueness_of :username }

        it { should validate_presence_of :email }
        it { should validate_uniqueness_of :email }

        it { should validate_confirmation_of :password }
    end

    context '(scopes)' do
        it '.random will return a random user' do
            srand(12345)
            p1 = User.create!(username: 'Jaime', email: 'test1', password: '12345')
            p2 = User.create!(username: 'Chris', email: 'test2', password: '12345')
            p3 = User.create!(username: 'Robin', email: 'test3', password: '12345')
            expect(User.random).to eq p3
        end
    end

    context '(encryption)' do
        it 'encrypts password before save, does not save password' do
            User.destroy_all
            User.create!({username: 'Test', email: 'test@test.com', password: 'password'})
            user = User.authenticate('Test', 'password')
            expect(user.password_hash).not_to include ('password')
            expect(user.password).to eq nil
        end
    end

    context '(authentication)' do
        it 'authenticates entered credentials' do
            User.destroy_all
            user = User.create!({username: 'Test', email: 'test@test.com', password: 'password'})
            expect(User.authenticate('Test', '12345')).to eq nil
            expect(User.authenticate('Test', 'password')).to eq user
        end
    end
end
