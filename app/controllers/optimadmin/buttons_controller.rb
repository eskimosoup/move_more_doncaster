module Optimadmin
  class ButtonsController < Optimadmin::ApplicationController
    before_action :set_button, only: [:show, :edit, :update, :destroy]

    def index
      @buttons = Optimadmin::BaseCollectionPresenter.new(collection: Button.where('link_text ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::ButtonPresenter)
    end

    def show
    end

    def new
      @button = Button.new
    end

    def edit
    end

    def create
      @button = Button.new(button_params)
      if @button.save
        redirect_to_index_or_continue_editing(@button)
      else
        render :new
      end
    end

    def update
      if @button.update(button_params)
        redirect_to_index_or_continue_editing(@button)
      else
        render :edit
      end
    end

    def destroy
      @button.destroy
      redirect_to buttons_url, notice: 'Button was successfully destroyed.'
    end

    private

    def set_button
      @button = Button.find(params[:id])
    end

    def button_params
      params.require(:button).permit(:area, :link_text, :link_url, :display)
    end
  end
end
