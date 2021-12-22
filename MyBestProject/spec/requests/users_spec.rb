# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    subject(:get_users) { get users_path }
    let!(:users) { create_list(:user, 3) }

    context 'without params' do
      it 'returns all users' do
        get_users

        expect(response).to have_http_status(200) # => expect(response.status).to eq(200)
        expect(assigns(:users)).to match_array(users)
      end
    end

    context 'with age filter' do
      before { user.update(age: 16) }

      let(:user) { users.first }

      it 'returns only adult users' do
        get users_path(age: 20)

        expect(response).to have_http_status(200) # => expect(response.status).to eq(200)
        expect(assigns(:users)).not_to include(user)
      end
    end
  end

  describe 'POST /users' do
    let(:params) do
      { user: { email: Faker::Internet.email } }
    end

    it 'returns error without params' do
      # expect { post users_path }.to raise_error(ActionController::ParameterMissing)
      post users_path

      expect(response).to have_http_status(422) # => expect(response.status).to eq(200)
    end

    it 'creates User from params' do
      # post users_path(params: params)

      expect { post users_path(params: params) }.to change(User, :count).by(1)
    end
  end

  describe 'Change balance' do
    let!(:user) { create(:user, balance: 100) }

    before do
      # ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord::Base)
      threads = []
      2.times { threads << Thread.new { patch change_balance_user_path(user, params: { credit: 20 }) } }
      threads.each(&:join)
    end

    it { expect(user.reload.balance).to eq(60) }
  end
end
