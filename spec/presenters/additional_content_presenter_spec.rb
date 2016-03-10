require 'rails_helper'
#  rspec --tag 'additional_content'
RSpec.describe AdditionalContentPresenter, type: :presenter, additional_content: true do
  let(:additional_content) { build(:additional_content) }
  subject(:additional_content_presenter) { AdditionalContentPresenter.new(object: additional_content, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:additional_content) }
  end

  describe 'standard additional_content' do
    it 'returns the content - html escaped' do
      expect(additional_content_presenter.content).to eq(raw(additional_content.content))
    end
  end
end
