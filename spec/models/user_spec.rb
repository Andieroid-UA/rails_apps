require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations tests' do
    it 'is not valid without a first name' do
      user = build(:user, first_name: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user = build(:user, last_name: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without a username' do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is invalid when password is nil' do
      user = build(:user, password: nil)
      # Your expectation goes here
    end

    it 'is invalid when password_confirmation is nil' do
      user = build(:user, password_confirmation: nil)
      # Your expectation goes here
    end

    it 'hashes the password' do
      user = create(:user)
      expect(user.password_digest).not_to eq 'password'
    end
  end

  context 'Uniqueness tests' do
    it 'is not valid without a unique username' do
      user1 = create(:user)
      user2 = build(:user, username: user1.username)
      user2.valid?

      expect(user2.errors[:username]).to include("has already been taken")
    end

    it 'is not valid without a unique email' do
      user1 = create(:user)
      user2 = build(:user, email: user1.email)
      user2.valid?

      expect(user2.errors[:email]).to include("has already been taken")
    end
  end

  context 'Destroy user and everything dependent on it' do
    let!(:user) { create(:user) }

    before do
      user.destroy
    end

    it 'deletes user profile' do
      expect(Profile.find_by(user_id: user.id)).to be_nil
    end

    it 'deletes user location' do
      expect(Location.find_by(locationable_id: user.id)).to be_nil
    end

    it 'deletes posts' do
      expect(Post.where(user_id: user.id)).to be_empty
    end

    it 'deletes comments' do
      expect(Comment.where(user_id: user.id)).to be_empty
    end
  end
end
