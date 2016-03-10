require 'rails_helper'

describe Optimadmin::HomePageItemsController, type: :controller, home_page_item: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe '#create' do
    context 'when Home page content is valid' do
      it 'redirects to index on normal save' do
        home_page_item = stub_valid_home_page_item

        post :create, commit: 'Save', home_page_item: home_page_item.attributes

        expect(response).to redirect_to(home_page_items_path)
        expect(flash[:notice]).to eq('Home page item was successfully created.')
      end

      it 'redirects to edit on save and continue editing' do
        home_page_item = stub_valid_home_page_item

        post :create, commit: 'Save and continue editing', home_page_item: home_page_item.attributes

        expect(response).to redirect_to(edit_home_page_item_path(home_page_item))
        expect(flash[:notice]).to eq('Home page item was successfully created.')
      end
    end

    context 'when Home page content is invalid' do
      it 'renders the edit template' do
        home_page_item = stub_invalid_home_page_item

        post :create, commit: 'Save', home_page_item: home_page_item.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe '#update' do
    context 'when Home page content is valid' do
      it 'redirects to index on normal save' do
        home_page_item = stub_valid_home_page_item

        patch :update, id: home_page_item.id, commit: 'Save', home_page_item: home_page_item.attributes

        expect(response).to redirect_to(home_page_items_path)
        expect(flash[:notice]).to eq('Home page item was successfully updated.')
      end

      it 'redirects to edit on save and continue editing' do
        home_page_item = stub_valid_home_page_item

        patch :update, id: home_page_item.id, commit: 'Save and continue editing', home_page_item: home_page_item.attributes

        expect(response).to redirect_to(edit_home_page_item_path(home_page_item))
        expect(flash[:notice]).to eq('Home page item was successfully updated.')
      end
    end

    context 'when Home page content is invalid' do
      it 'renders the edit template' do
        home_page_item = stub_invalid_home_page_item

        patch :update, id: home_page_item.id, commit: 'Save', home_page_item: home_page_item.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_home_page_item
    home_page_item = build_stubbed(:home_page_item)
    allow(HomePageItem).to receive(:new).and_return(home_page_item)
    allow(home_page_item).to receive(:save).and_return(true)
    allow(HomePageItem).to receive(:find).and_return(home_page_item)
    allow(home_page_item).to receive(:update).and_return(true)
    home_page_item
  end

  def stub_invalid_home_page_item
    home_page_item = build_stubbed(:home_page_item)
    allow(HomePageItem).to receive(:new).and_return(home_page_item)
    allow(home_page_item).to receive(:save).and_return(false)
    allow(HomePageItem).to receive(:find).and_return(home_page_item)
    allow(home_page_item).to receive(:update).and_return(false)
    home_page_item
  end
end
