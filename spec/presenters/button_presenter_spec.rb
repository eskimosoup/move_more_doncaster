require 'rails_helper'
#  rspec --tag 'button'
RSpec.describe ButtonPresenter, type: :presenter, button: true do
  let(:button) { build(:button) }
  subject(:button_presenter) { ButtonPresenter.new(object: button, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:link_text).to(:button) }
    it { should delegate_method(:link_url).to(:button) }
  end

  describe 'standard button' do
    it 'returns the linked title' do
      expect(button_presenter.linked_text(button.link_text, title: button.link_text)).to eq(link_to(button.link_text, button.link_url, title: button.link_text))
    end
  end
end
