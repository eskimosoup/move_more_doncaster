class ButtonPresenter < BasePresenter
  presents :button
  delegate :id, :link_text, :link_url, to: :button

  def linked_text(text = 'View', options = {})
    h.link_to text, button.link_url, options
  end
end
