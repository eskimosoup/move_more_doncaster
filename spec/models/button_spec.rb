require 'rails_helper'
#  rspec --tag 'button'
RSpec.describe Button, type: :model, button: true do
  describe 'validations', :validation do
    subject(:button) { build(:button) }
    it { should validate_presence_of(:link_url) }
    it { should validate_presence_of(:link_text) }
    it { should validate_presence_of(:area) }
    it { should validate_uniqueness_of(:area) }
    it { should validate_inclusion_of(:area).in_array(Button::AREAS) }
  end

  describe 'scopes', :scope do
    let(:button) { create(:button) }
    let(:hidden_button) { create(:button, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(Button.displayed).not_to include hidden_button
      end

      it 'returns displayed records' do
        expect(Button.displayed).to include button
      end
    end
  end
end
