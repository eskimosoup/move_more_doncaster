module Optimadmin
  class ButtonPresenter < Optimadmin::BasePresenter
    presents :button
    delegate :id, :link_text, :link_url, to: :button

    def toggle_title
      inline_detail_toggle_link(link_text)
    end

    def optimadmin_summary
      h.link_to link_text, link_url, target: '_blank'
    end
  end
end
