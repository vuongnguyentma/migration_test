class BasicMailer < ApplicationMailer
	default from: "nqvuong@tma.com.vn"

  def basic_email user
    @user = user
    mail to: @user.email, subject: "Fill Passport"
  end

  def send_sign_up_mail(id)
  	@user = User.find(id)
  	mail to: @user.email, subject: "Confirm your account"
  end
end