require 'rails_helper'

describe 'UserTokens' do
  before(:each) do
    create(:user)
  end

  it 'generated sucessfull when pass valid credentials' do
    post '/api/v1/user_token', params: { email: 'example@example.com', password: 'exampleee' }
    expect(response.status).to eq(201)
    expect(response.body)
  end

  it "returns 403 with invalid email" do
    post '/api/v1/user_token', params: { email: 'unexistent@example.com', password: 'exampleee' }
    expect(response).to have_http_status(403)
  end

  it "returns 403 with invalid password" do
    post '/api/v1/user_token', params: { email: 'example@example.com', password: 'not_matched' }
    expect(response).to have_http_status(403)
  end

end
