require "rails_helper"

describe Optimadmin::ButtonsController, type: :controller, button: true do
  routes { Optimadmin::Engine.routes }
  before(:each) do
    sign_in
  end

  describe "#create" do
    context "when Button is valid" do
      it "redirects to index on normal save" do
        button = stub_valid_button

        post :create, commit: "Save", button: button.attributes

        expect(response).to redirect_to(buttons_path)
        expect(flash[:notice]).to eq("Button was successfully created.")
      end

      it "redirects to edit on save and continue editing" do
        button = stub_valid_button

        post :create, commit: "Save and continue editing", button: button.attributes

        expect(response).to redirect_to(edit_button_path(button))
        expect(flash[:notice]).to eq("Button was successfully created.")
      end
    end

    context "when Button is invalid" do
      it "renders the edit template" do
        button = stub_invalid_button

        post :create, commit: "Save", button: button.attributes

        expect(response).to render_template(:new)
      end
    end
  end

  describe "#update" do
    context "when Button is valid" do
      it "redirects to index on normal save" do
        button = stub_valid_button

        patch :update, id: button.id, commit: "Save", button: button.attributes

        expect(response).to redirect_to(buttons_path)
        expect(flash[:notice]).to eq("Button was successfully updated.")
      end

      it "redirects to edit on save and continue editing" do
        button = stub_valid_button

        patch :update, id: button.id, commit: "Save and continue editing", button: button.attributes

        expect(response).to redirect_to(edit_button_path(button))
        expect(flash[:notice]).to eq("Button was successfully updated.")
      end
    end

    context "when Button is invalid" do
      it "renders the edit template" do
        button = stub_invalid_button

        patch :update, id: button.id, commit: "Save", button: button.attributes

        expect(response).to render_template(:edit)
      end
    end
  end

  def stub_valid_button
    button = build_stubbed(:button)
    allow(Button).to receive(:new).and_return(button)
    allow(button).to receive(:save).and_return(true)
    allow(Button).to receive(:find).and_return(button)
    allow(button).to receive(:update).and_return(true)
    button
  end

  def stub_invalid_button
    button = build_stubbed(:button)
    allow(Button).to receive(:new).and_return(button)
    allow(button).to receive(:save).and_return(false)
    allow(Button).to receive(:find).and_return(button)
    allow(button).to receive(:update).and_return(false)
    button
  end
end
