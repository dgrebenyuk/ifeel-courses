require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:new_user) { build(:user) }
  subject(:persisted_user) { create(:user, first_name: 'Tomas', age: 35) }
  subject(:premium_user) { create(:premium_user) }
  subject(:premium_user_with_age) { create(:user, :premium, :with_age) }

  describe '.set_age' do
    it 'default value is nil' do
      expect(new_user.age).to be_nil
    end

    it 'sets age value after save' do
      new_user.save
      expect(new_user.age).not_to be_nil
    end

    it 'sets age value in range 16..60' do
      new_user.save
      expect(new_user.age).to be_between(16, 60)
    end
  end

  describe '#phone_number' do
    context 'with profile' do
      let!(:profile) { create(:profile, user: persisted_user) }

      it 'returns phone number from profile' do
        expect(persisted_user.phone_number).to eq(profile.phone_number)
      end
    end

    context 'without profile' do
      it 'returns nil if profile is missing' do
        expect(persisted_user.phone_number).to be_nil
      end
    end

    context 'without profile with exception' do
      xit 'raises exception if profile is missing' do
        expect { persisted_user.phone_number }.to raise_error(Module::DelegationError)
      end
    end

    context 'with profile without exception' do
      before { create(:profile, user: persisted_user) }

      it 'does not raise exception if profile is present' do
        expect { persisted_user.phone_number }.not_to raise_error
      end
    end
  end
end
