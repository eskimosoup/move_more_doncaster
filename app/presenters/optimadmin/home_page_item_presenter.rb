module Optimadmin
  class HomePageItemPresenter < Optimadmin::BasePresenter
    presents :home_page_item
    delegate :id, :title, to: :home_page_item

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format home_page_item.content
    end
  end
end
