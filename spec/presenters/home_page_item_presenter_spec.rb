require 'rails_helper'
#  rspec --tag 'home_page_item'
RSpec.describe HomePageItemPresenter, type: :presenter, home_page_item: true do
  let(:home_page_item) { build(:home_page_item) }
  subject(:home_page_item_presenter) { HomePageItemPresenter.new(object: home_page_item, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:home_page_item) }
    it { should delegate_method(:colour).to(:home_page_item) }
  end

  describe 'standard home_page_item' do
    it 'returns the content - html escaped' do
      expect(home_page_item_presenter.content).to eq(raw(home_page_item.content))
    end
  end
end
