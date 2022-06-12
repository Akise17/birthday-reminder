require 'rails_helper'

RSpec.describe "User ====================================================" do
  user_id = ''

  def sign_in
    header = { 'Content-Type': 'application/json' }
    body = { email: 'user1@example.com',
             password: '12345678' }
    post(
      '/auth/sign_in',
      headers: header,
      params: body.to_json
    )
    client = response.header['client']
    uid = response.header['uid']
    token = response.header['access-token']
    return client, uid, token
  end

  describe 'POST | /auth/sign_in', type: :request do
    it 'it should failed to sign in' do
      header = { 'Content-Type': 'application/json' }
      body = { email: 'user2@example.com',
               password: '12345678' }
      post(
        '/auth/sign_in',
        headers: header,
        params: body.to_json
      )
      expect(response.code).to eql('401')
    end
  end

  describe 'POST | /v1/user', type: :request do
    it 'it should create user' do
      client, uid, token = sign_in

      header = { 'Content-Type': 'application/json',
                 'client': client,
                 'uid': uid,
                 'access-token': token }
      body = { first_name: 'Akise',
               last_name: 'Aru',
               birthday_date: Date.today,
               location: 'Tangerang',
               country: 'Indonesia' }
       post(
        '/v1/user',
        headers: header,
        params: body.to_json
      )
      json = JSON.parse(response.body)
      user_id = json['data']['id']
      expect(response.code).to eql('201')
    end
  end

  describe 'PUT | /v1/user/:id', type: :request do
    it 'it should update user' do
      client, uid, token = sign_in

      header = { 'Content-Type': 'application/json',
                 'client': client,
                 'uid': uid,
                 'access-token': token }
      body = { first_name: 'Ahmad',
               last_name: 'Fauzan',
               birthday_date: Date.today,
               location: 'Bali',
               country: 'Indonesia' }
       put(
        "/v1/user/#{user_id}",
        headers: header,
        params: body.to_json
      )
      expect(response.code).to eql('200')
    end
  end

  describe 'DELETE | /v1/user/:id', type: :request do
    it 'it should soft delete user' do
      client, uid, token = sign_in

      header = { 'Content-Type': 'application/json',
                 'client': client,
                 'uid': uid,
                 'access-token': token }
       delete(
        "/v1/user/#{user_id}",
        headers: header
      )
      expect(response.code).to eql('200')
    end
  end
end
