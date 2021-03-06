require 'user'

RSpec.describe User do
    describe '.register' do
        it "it allows a new user to be created" do
        user1 = User.register(username: 'juliana1010', password: "password1")
        expect(user1.username).to eq 'juliana1010'
        expect(user1).to be_a User
        end
    end

    describe '.authenticate' do 
        it 'returns a user given a correct username and password, if one exists' do
            user1 = User.register(username: 'juliana1010', password: "password1")
            authenticated_user = User.authenticate(username:'juliana1010', password:'password1')
            expect(authenticated_user.username).to eq user1.username
            expect(authenticated_user.user_id).to eq user1.user_id
        end

        it 'returns nil if the user does not exist' do
            user1 = User.register(username: 'random123', password: "password1")
            authenticated_user = User.authenticate(username:'juliana1010', password:'password1')
            expect(authenticated_user).to eq nil
        end

        it 'returns nil if the password does not match' do
            user1 = User.register(username: 'random123', password: "password1")
            authenticated_user = User.authenticate(username:'random123', password:'password')
            expect(authenticated_user).to eq nil
        end
    end
end

            
            
    