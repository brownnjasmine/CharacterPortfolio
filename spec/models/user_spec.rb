require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'New user registration' do
      context 'successful registration' do
        it 'email and password being able to register with confirmation' do
          expect(@user).to be_valid
        end
        it 'Register with password of8 characters or more' do
          @user.password = 'abcdefhi'
          @user.password_confirmation = 'abcdefhi'
          expect(@user).to be_valid
        end
      end

      context 'failed registration' do
        it 'cannot register without email' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Email can\'t be blank')
        end
        it 'cannot register with duplicate emails' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'cannot register without password' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Password can\'t be blank')
        end
        it 'cannot register without password confirmation' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Password confirmation doesn\'t match Password')
        end
        it 'cannot register with password shorter than 6 characters' do
          @user.password = 'abcde'
          @user.password_confirmation = 'abcde'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 8 characters)')
        end
      end
    end
  end
end