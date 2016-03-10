module Optimadmin
  class HomePageItemsController < Optimadmin::ApplicationController
    before_action :set_home_page_item, only: [:show, :edit, :update, :destroy]

    def index
      @home_page_items = Optimadmin::BaseCollectionPresenter.new(collection: HomePageItem.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::HomePageItemPresenter)
    end

    def show
    end

    def new
      @home_page_item = HomePageItem.new
    end

    def edit
    end

    def create
      @home_page_item = HomePageItem.new(home_page_item_params)
      if @home_page_item.save
        redirect_to_index_or_continue_editing(@home_page_item)
      else
        render :new
      end
    end

    def update
      if @home_page_item.update(home_page_item_params)
        redirect_to_index_or_continue_editing(@home_page_item)
      else
        render :edit
      end
    end

    def destroy
      @home_page_item.destroy
      redirect_to home_page_items_url, notice: 'Home page content was successfully destroyed.'
    end

  private


    def set_home_page_item
      @home_page_item = HomePageItem.find(params[:id])
    end

    def home_page_item_params
      params.require(:home_page_item).permit(:position, :title, :content, :colour, :display)
    end
  end
end
