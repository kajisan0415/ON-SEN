require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字は×' do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it '一意性があること' do
        user.name = other_user.name
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '270文字以下であること: 270文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 270)
        is_expected.to eq true
      end
      it '270文字以下であること: 271文字は×' do
        user.introduction = Faker::Lorem.characters(number: 271)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Blogモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:blogs).macro).to eq :has_many
      end
    end
  end
end
