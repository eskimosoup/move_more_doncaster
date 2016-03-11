class ContactsController < ApplicationController
  before_action :contact_content

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.new_contact(@contact).deliver_now
      redirect_to new_contact_path, notice: 'Thank you for contacting us'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:forename, :surname, :email, :message)
  end

  def contact_content
    @additional_content = AdditionalContent.displayed.find_by(area: 'contact_form')
  end
end
