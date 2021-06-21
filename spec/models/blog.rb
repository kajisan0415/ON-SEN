require 'rails_helper'

RSpec.describe 'Blogモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { blog.valid? }

    let(:user) { create(:user) }
    let!(:blog) { build(:blog, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        blog.title = ''
        is_expected.to eq false
      end
    end

    context 'start_timeカラム' do
      it '空欄でないこと' do
        blog.start_time = ''
        is_expected.to eq false
      end
    end

    context 'memoカラム' do
      it '220文字以下であること: 221文字は×' do
        blog.memo = Faker::Lorem.characters(number: 221)
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '400文字以下であること: 401文字は×' do
        blog.body = Faker::Lorem.characters(number: 401)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Blog.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end