class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.create(inquiry_params)

    if (@inquiry.valid?)
      InquiryMailer.inquiry_email(@inquiry).deliver_now

      flash[:notice] = "Stealing your identity just became that much easier. Thank you."
      redirect_to root_url
    else
      # flash.now.alert = @inquiry.errors.messages.inspect
      # flash.now.alert="There is a problem with your form. Please check it."
      # @inquiry = Inquiry.new
      render :new
    end
  end
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :subject, :message)
  end
end
