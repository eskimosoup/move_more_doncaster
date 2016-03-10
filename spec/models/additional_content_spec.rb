require 'rails_helper'
#  rspec --tag 'additional_content'
RSpec.describe AdditionalContent, type: :model, additional_content: true do
  describe 'validations', :validation do
    subject(:additional_content) { build(:additional_content) }
    it { should validate_presence_of(:content) }
    it { should validate_inclusion_of(:area).in_array(AdditionalContent::AREAS) }
    it { should validate_uniqueness_of(:area) }
  end

  describe 'scopes', :scope do
    let(:additional_content) { create(:additional_content) }
    let(:hidden_additional_content) { create(:additional_content, display: false) }

    describe 'displayed' do
      it 'excludes hidden records' do
        expect(AdditionalContent.displayed).not_to include hidden_additional_content
      end

      it 'returns displayed records' do
        expect(AdditionalContent.displayed).to include additional_content
      end
    end
  end
end
