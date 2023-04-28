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
        it 'Register with password of 6 characters or more' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          expect(@user).to be_valid
        end
      end

      context 'failed registration' do
        it 'cannot register without email' do
          @user.email = nil
          @user.vaild?
          expect(@user.errors.full_messages).to include('Please enter your email')
        end
        it 'cannot register with duplicate emails' do
          @user.save
          another_user = FactoryBod.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email already exists')
        end
        it 'cannot register without password' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include('Please enter your password')
        end
        it 'cannot register without password confirmation' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('Password (for confirmation) and password input do not match')
        end
        it 'cannot register with password shorter than 6 characters' do
          @user.password = 'abcde'
          @user.password_confirmation = 'abcde'
          @user.valid?
          expect(@user.errors.full_messages).to include('Please enter a password with at least 6 characters')
        end
      end
    end
  end
end