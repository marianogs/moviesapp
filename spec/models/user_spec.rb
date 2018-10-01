require 'rails_helper'

describe User, type: :model do
  it do
    expect(User.new).to respond_to(:email)
    expect(User.new).to respond_to(:password)
  end

  describe '#password' do
    let(:user) { build :user }
    it 'must be present' do
      user.password = nil 
      expect(user).to_not be(:valid)
    end
  end

  describe '#email' do
    it 'is unique' do
      create(:user,email: 'example@example.com')
      repeteated_user = build(:user,email: 'example@example.com')
      expect(repeteated_user).to_not be(:valid)
    end

    it 'matches valid pattern' do
      expect(build(:user,email: 'nomatchpatt,rij')).to_not be(:valid)
      expect(build(:user,email: 'nomatchpatt@rij')).to_not be(:valid)
      expect(build(:user,email: 'no,asdifjoa@.comasdiofjotchpatt@rij')).to_not be(:valid)
    end
  end
end
