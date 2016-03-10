require 'rails_helper'
#  rspec --tag 'home_page_item'
RSpec.describe HomePageItem, type: :model, home_page_item: true do
  describe 'validations', :validation do
    subject(:home_page_item) { build(:home_page_item) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_inclusion_of(:colour).in_array(HomePageItem::COLOURS) }
  end

  describe 'scopes', :scope do
    let(:home_page_item) { create(:home_page_item) }
    let(:hidden_home_page_item) { create(:home_page_item, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(HomePageItem.displayed).not_to include hidden_home_page_item
      end

      it 'returns displayed records' do
        expect(HomePageItem.displayed).to include home_page_item
      end
    end
  end
end
