require 'rails_helper'

describe '::Api::V1::User', type: :request do 

  context 'when need register a new user' do
    context 'when use a correcty payload' do 
      it 'shoud be a status code 201 CREATED' do
        correct_param = 
          {
            "user":{
              "name": "survivor",
              "age": 55,
              "cpf": "02116532109"
            }
          }

        post '/api/v1/user', params: correct_param, headers: { 'ACCEPT' => 'application/json' }

        expect(response.status).to eq 201
        expect(response.body.blank?).not_to eq true 
        expect(JSON.parse(response.body)['data']['name']).to eq 'survivor' 
        expect(JSON.parse(response.body)['data']['age']).to eq 55
        expect(JSON.parse(response.body)['data']['cpf']).to eq '02116532109'
      end
    end

    context 'when use a incorrecty payload' do
      it 'shoud be a status code 400 BAD REQUEST' do
        correct_param = 
          {
            "user":{
              "age": 55,
              "cpf": "02116532109"
            }
          }

        post '/api/v1/user', params: correct_param, headers: { 'ACCEPT' => 'application/json' }

        expect(response.status).to eq 400
      end
    end
  end
end
