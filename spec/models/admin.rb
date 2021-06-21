require 'rails_helper'

RSpec.describe 'Adminモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { admin.valid? }

    let!(:other_admin) { create(:admin) }
    let(:admin) { build(:admin) }

    context 'nameカラム' do
      it '空欄でないこと' do
        admin.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        admin.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        admin.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        admin.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字は×' do
        admin.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it '一意性があること' do
        admin.name = other_admin.name
        is_expected.to eq false
      end
    end
  end

end