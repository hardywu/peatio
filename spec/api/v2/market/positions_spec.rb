# encoding: UTF-8
# frozen_string_literal: true

describe API::V2::Market::Positions, type: :request do
  let(:member) { create(:member, :level_3) }
  let(:level_0_member) { create(:member, :level_0) }
  let(:token) { jwt_for(member) }
  let(:level_0_member_token) { jwt_for(level_0_member) }

  describe 'GET /api/v2/market/positions' do
    it 'should require authentication' do
      get '/api/v2/market/positions'
      expect(response.code).to eq '401'
    end

    it 'should return positions by default' do
      api_get '/api/v2/market/positions', token: token

      expect(response).to be_success
      expect(JSON.parse(response.body).size).to eq 1
    end
  end
end