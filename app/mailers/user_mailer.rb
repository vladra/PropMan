class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://guides.rubyonrails.org/action_mailer_basics.html'
  	mail(to: @tenant.email, subject: 'Omg Hi')
  end
end
