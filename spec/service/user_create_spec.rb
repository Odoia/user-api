require 'rails_helper'

describe '::User::create', type: :service do

  context 'when need create a new user' do
    context 'when use a correcty params' do 
      it 'shoud be a new user in db' do

        ::User.create.tap do |u|
          u.name = 'asdf'
          u.age = 12
          u.cpf = '124534'
          u.save
        end

        expect(::User.count).to eq 1
      end
    end
  end
end
