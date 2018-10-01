require 'rails_helper'

describe  Api::V1::MoviesController do
  #todo test all 404 responses

  describe 'GET /api/v1/movies', type: :request do
    context 'when no exists movies' do
      it 'returns empty list' do
        get '/api/v1/movies/'
        expect(JSON.parse(response.body)).to eq([])
      end
    end
  end

  describe 'GET /api/v1/movies/:id', type: :request do
    context('movie no has casting' ) do
    end
    let(:movie){ create :movie }
    before(:each){ get "/api/v1/movies/#{movie.id}" }

    it 'returns movie' do
      expect(JSON.parse(response.body)['title']).to eq('Grand Torino')
    end

    it 'returns release year in roman numerals' do
      pending
      fail
    end

    it 'returns 200' do
      expect(response.code).to eq("200")
    end

    context 'movie has casting' do
      let(:movie) { create(:movie_with_members) }
      let(:movie_body){ JSON.parse(response.body) } 

      it 'returns movie directors' do
        expect(movie_body['directors'][0]['aliases']).to eq('Clint Eastwood')
      end

      it 'returns movie casting' do
        expect(movie_body['casting'][0]['aliases']).to eq('Clint Eastwood')
      end

      it 'returns movie producers' do
        expect(movie_body['producers'][0]['aliases']).to eq('Clint Eastwood')
      end
    end
  end

  describe 'PUT /api/v1/movies/:id', type: :request do
    let(:movie){ create :movie }
    context 'with invalid attributes' do
      before { put "/api/v1/movies/#{movie.id}", params: { movie: { title: '' } } }
      it 'returns 422' do
        expect(response.code).to eq("422")
      end

      it 'returns message error in body' do
        expect(JSON.parse(response.body)).to have_key('message')
      end

      it 'cannot update movie' do
        expect(movie.reload.title).to eq('Grand Torino')
      end

      it 'returns 422' do
        expect(response.code).to eq('422')
      end
    end

    context 'with valid attributes' do
      before { put "/api/v1/movies/#{movie.id}", params: { movie: { title: 'Grand Torino 2' } } }
      it 'updates movie' do
        expect(movie.reload.title).to eq('Grand Torino 2')
        expect(JSON.parse(response.body)['title']).to eq('Grand Torino 2')
      end

      it 'returns 200' do
        expect(response.code).to eq('200')
      end
    end
  end

  describe 'DELETE /api/v1/movies/:id' do
    let(:movie){ create :movie }
    before { delete "/api/v1/movies/#{movie.id}" }
    it 'returns 204'  do
      expect(Movie.count).to eq(0)
      expect(response.code).to eq('204')
    end
  end

  describe 'POST /api/v1/movies', type: :request do
    context 'when attributes are invalid'  do
      it 'returns 422' do
        post '/api/v1/movies/', params: { movie: { title: '', release_year: '' } }
        expect(response.code).to eq("422")
      end

      it 'returns error json messages' do
        post '/api/v1/movies/', params: { movie: { title: '', release_year: '' } }
        expect(response.code).to eq("422")
      end
    end

    context 'when attributes are valid' do
      let(:valid_movie_attributes) do 
        { movie: { title: 'Grand Torino', release_year: 2006 }} 
      end

      before(:each) { post '/api/v1/movies/', params: valid_movie_attributes }

      it 'returns 201' do
        expect(response.code).to eq("201")
      end

      it 'returns movie in request body' do
        expect(JSON.parse(response.body)['release_year']).to eq(2006)
        expect(JSON.parse(response.body)['title']).to eq('Grand Torino')
      end

      it 'increment movies count' do
        # todo replace this for increment matcher
        expect(Movie.count).to eq(1)
      end
    end
  end
end
