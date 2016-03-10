class AdditionalContentPresenter < BasePresenter
  presents :additional_content
  delegate :title, to: :additional_content

  def content
    h.raw additional_content.content
  end
end
