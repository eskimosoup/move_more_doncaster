module Optimadmin
  class AdditionalContentPresenter < Optimadmin::BasePresenter
    presents :additional_content
    delegate :id, :title, to: :additional_content

    def area
      additional_content.area.humanize
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format additional_content.content
    end
  end
end
