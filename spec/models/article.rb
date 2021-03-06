require 'rails_helper'

RSpec.describe 'Articleモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { article.valid? }

    let(:admin) { create(:admin) }
    let!(:article) { build(:article, admin_id: admin.id) }
    let(:other_article) { create(:article, admin_id: admin.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        article.name = ''
        is_expected.to eq false
      end

      it '一意性があること' do
        article.name = other_article.name
        is_expected.to eq false
      end
    end

    context 'address_cityカラム' do
      it '空欄でないこと' do
        article.address_city = ''
        is_expected.to eq false
      end
    end

    context 'imageカラム' do
      it '空欄でないこと' do
        article.image_id = ''
        is_expected.to eq false
      end
    end
  end
end
