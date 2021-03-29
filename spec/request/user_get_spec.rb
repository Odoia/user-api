require 'rails_helper'

describe '::Api::V1::User', type: :request do 

  context 'when need list all user' do
    context 'when dont has a user on db' do
      it 'shoud be a status code 200 OK and a empty array' do

        get '/api/v1/user', headers: { 'ACCEPT' => 'application/json' }

        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['data']).to eq []
      end
    end

    context 'when has a user on db' do
      it 'shoud be a status code 200 OK and a user list' do

        5.times do
          ::User.create.tap do |u|
            u.name = 'aa'
            u.age = 11
            u.cpf = '123123123'
            u.save
          end
        end

        get '/api/v1/user', headers: { 'ACCEPT' => 'application/json' }

        expect(response.status).to eq 200
        expect(JSON.parse(response.body)['data'].count).to eq 5
      end
    end
  end
end
