class HomePageItemPresenter < BasePresenter
  presents :home_page_item
  delegate :title, :colour, to: :home_page_item

  def content
    h.raw home_page_item.content
  end
end
