require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(20) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  describe 'pending approval' do
    let(:user){ create(:user) }

    it 'change pending approval from nil to false' do
      expect do
        user.confirm_verification!
      end.to change { user.pending_approval }.from(nil).to(false)
    end

    it 'change pending approval from nil to true' do
      expect do
        user.decline_verification!
      end.to change { user.pending_approval }.from(nil).to(true)
    end
  end

  describe '.find_for_oauth' do
    let!(:user){ create(:user) }
    let(:auth){ OmniAuth::AuthHash.new(provider: 'vkontakte', uid: '123456') }

    context 'user already registered' do
      it 'returns the user' do
        user.authorizations.create(provider: 'vkontakte', uid: '123456')
        expect(User.find_for_oauth(auth)).to eq user
      end
    end

    context 'user has not authorization' do
      context 'user already exist' do

        let(:auth) do OmniAuth::AuthHash.new(
            provider: 'vkontakte',
            uid: '123456',
            info: { email: user.email, name: user.name }
        ) end

        let(:auth_email_nil) do OmniAuth::AuthHash.new(
            provider: 'vkontakte',
            uid: '123456',
            info: { email: '', name: 'New Name' }
        ) end

        it 'does not create new user' do
          expect do
            User.find_for_oauth(auth)
          end.to_not change(User, :count)
        end

        it 'creates authorization for user' do
          expect do
            User.find_for_oauth(auth)
          end.to change(user.authorizations, :count).by(1)
        end

        it 'creates authorizations with provider and uid' do
          authorization = User.find_for_oauth(auth).authorizations.first

          expect(authorization.provider).to eq auth.provider
          expect(authorization.uid).to eq auth.uid
        end

        it 'returns the user' do
          expect(User.find_for_oauth(auth)).to eq user
        end

        it 'returns nil if email blank' do
          expect(User.find_for_oauth(auth_email_nil)).to be_nil
        end
      end

      context 'user does not exist' do

        let(:auth) do OmniAuth::AuthHash.new(
            provider: 'vkontakte',
            uid: '123456',
            info: {
                email: 'new@user.com',
                first_name: 'First Name',
                last_name: 'Last Name',
                city: 'City',
                url: 'http://test.url'
            }
        ) end

        let(:auth_email_nil) do OmniAuth::AuthHash.new(
            provider: 'vkontakte',
            uid: '123456',
            info: {
                email: '',
                first_name: 'First Name',
                last_name: 'Last Name',
                city: 'City',
                url: 'http://test.url'
            }
        ) end

        it 'creates new user'do
          expect { User.find_for_oauth(auth) }.to change(User, :count).by(1)
        end

        it 'return new user' do
          expect(User.find_for_oauth(auth)).to be_a(User)
        end

        it 'fills user name' do
          user = User.find_for_oauth(auth)
          expect(user.name).to eq auth.info.first_name
        end

        it 'fills user surname' do
          user = User.find_for_oauth(auth)
          expect(user.surname).to eq auth.info.last_name
        end

        it 'fills user email' do
          user = User.find_for_oauth(auth)
          expect(user.email).to eq auth.info.email
        end

        it 'creates authorization for user' do
          user = User.find_for_oauth(auth)
          expect(user.authorizations).to_not be_empty
        end

        it 'create authorization with provider and uid' do
          authorization = User.find_for_oauth(auth).authorizations.first

          expect(authorization.provider).to eq auth.provider
          expect(authorization.uid).to eq auth.uid
        end

        it 'returns nil if email blank' do
          expect(User.find_for_oauth(auth_email_nil)).to be_nil
        end
      end
    end
  end
end
