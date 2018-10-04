require 'rails_helper'
describe  Api::V1::PeopleController do
  #todo test all 404 responses
  let(:token) { create(:user).generate_api_token! }
  describe 'GET /api/v1/people', type: :request do
    context 'when no exists people' do
      it 'returns empty list' do
        get '/api/v1/people/'
        expect(JSON.parse(response.body)).to eq([])
      end
    end
  end

  describe 'GET /api/v1/people/:id', type: :request do
    let(:person){ create :person }
    before(:each){ get "/api/v1/people/#{person.id}" }
    context('person no has casting' ) do
    end

    it 'returns person' do
      expect(JSON.parse(response.body)['first_name']).to eq('Clinton')
    end

    it 'returns 200' do
      expect(response.code).to eq("200")
    end

    context 'person has participations' do
      let(:person) { create(:person_with_participations) }
      let(:person_body){ JSON.parse(response.body) } 

      it 'returns person directors' do
        expect(person_body['directions'][0]['title']).to eq('Grand Torino')
      end

      it 'returns person casting' do
        expect(person_body['performances'][0]['title']).to eq('Grand Torino')
      end

      it 'returns person producers' do
        expect(person_body['productions'][0]['title']).to eq('Grand Torino')
      end
    end
  end

  describe 'PUT /api/v1/people/:id', type: :request do
    let(:person){ create :person }
    context 'with invalid attributes' do
      before { put "/api/v1/people/#{person.id}", params: { person: { first_name: '' } } ,headers:  {'TOKEN' => token} }
      it 'returns 422' do
        expect(response.code).to eq("422")
      end

      it 'returns message error in body' do
        expect(JSON.parse(response.body)).to have_key('message')
      end

      it 'cannot update person' do
        expect(person.reload.first_name).to eq('Clinton')
      end

      it 'returns 422' do
        expect(response.code).to eq('422')
      end

    end

    it 'returns 401 when token is invalid' do
      put "/api/v1/people/#{person.id}", params: { person: { first_name: '' } } ,headers:  {'TOKEN' => 'invalid'}
      expect(response.code).to eq('401')
    end

    context 'with valid attributes' do
      before { put "/api/v1/people/#{person.id}", params: { person: { first_name: 'Clinton 2' } } , headers:  {'TOKEN' => token} }
      it 'updates person' do
        expect(person.reload.first_name).to eq('Clinton 2')
        expect(JSON.parse(response.body)['first_name']).to eq('Clinton 2')
      end

      it 'returns 200' do
        expect(response.code).to eq('200')
      end
    end
  end

  describe 'DELETE /api/v1/people/:id' do
    let(:person){ create :person }
    it 'returns 204'  do
      delete "/api/v1/people/#{person.id}",headers:  {'TOKEN' => token}
      expect(Person.count).to eq(0)
      expect(response.code).to eq('204')
    end

    it 'returns 401 when token is invalid' do
      delete "/api/v1/people/#{person.id}",headers:  {'TOKEN' => 'invalid'}
      expect(response.code).to eq('401')
    end
  end

  describe 'POST /api/v1/people', type: :request do
    context 'when attributes are invalid'  do
      it 'returns 422' do
        post '/api/v1/people/', params: { person: { first_name: '' } }, headers:  {'TOKEN' => token}
        expect(response.code).to eq("422")
      end

      it 'returns error json messages' do
        post '/api/v1/people/', params: { person: { first_name: '' } },headers:  {'TOKEN' => token}
        expect(response.code).to eq("422")
      end
    end

    it 'returns 401 when token is invalid' do
      post "/api/v1/people/", params: { person: { first_name: '' } } ,headers:  {'TOKEN' => 'invalid'}
      expect(response.code).to eq('401')
    end

    context 'when attributes are valid' do
      let(:valid_person_attributes) do 
        { person: { first_name: 'Clinton', last_name: "Eastwood",aliases: 'Clint Eastwood'}} 
      end

      before(:each) { post '/api/v1/people/', params: valid_person_attributes, headers:  {'TOKEN' => token}}

      it 'returns 201' do
        expect(response.code).to eq("201")
      end

      it 'returns person in request body' do
        expect(JSON.parse(response.body)['first_name']).to eq('Clinton')
        expect(JSON.parse(response.body)['last_name']).to eq('Eastwood')
      end

      it 'increment people count' do
        # todo replace this for increment matcher
        expect(Person.count).to eq(1)
      end
    end
  end
end
