class ReferralsController < ApplicationController
  before_action :referral_content

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new(referral_params)
    if @referral.valid?
      ReferralMailer.new_referral(@referral).deliver_now
      redirect_to new_referral_path, notice: 'Thank you for your submission.'
    else
      render :new
    end
  end

  private

  def referral_params
    params.require(:referral)
          .permit(:title, :name, :address, :contact_method_details, :additional_information, :date_of_birth)
  end

  def referral_content
    @additional_content = AdditionalContent.displayed.find_by(area: 'referral_form')
  end
end
