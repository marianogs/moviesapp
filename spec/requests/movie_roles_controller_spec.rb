require 'rails_helper'

describe  Api::V1::MovieRolesController do
  let(:token) { create(:user).generate_api_token! }

  describe 'DELETE /api/v1/movies/:movie_id/members/:member_id' do
    let(:movie_role) { create(:movie_role) }
    it do
      delete "/api/v1/movies/#{movie_role.movie_id}/members/#{ movie_role.id }", 
        headers: {'TOKEN' => token}
        expect(response.code).to eq('204')
        expect(MovieRole.count).to eq(0)
    end
  end

  describe 'POST /api/v1/movies/:movie_id/members/', type: :request do
    context 'when no exists movies' do
      let(:movie) { create :movie  }
      let(:person){ create :person }
      context 'invalid member' do
        let(:attributes){ { member: { role_name: 'actor', person_id: 'unexistent' } } }
        before(:each) do
          post "/api/v1/movies/#{movie.id}/members",
            params: attributes ,
            headers:  {'TOKEN' => token}
        end

        it 'returns 422' do
          expect(response.code).to eq('422')
        end
      end

      context 'valid member' do
        let(:attributes){ { member: { role_name: 'actor', person_id: person.id } } }
        before(:each) do
          post "/api/v1/movies/#{movie.id}/members",
            params: attributes ,
            headers:  {'TOKEN' => token}
        end

        it 'returns 201' do
          expect(response.code).to eq('201')
        end
        it 'add a member' do
          expect(movie.reload.casting.count).to eq(1)
        end
      end
    end
  end
end
