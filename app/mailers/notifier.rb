class Notifier < ActionMailer::Base
  default from: "'PropMan' info@propman-production.herokuapp.com"

  def welcome_email(recipient, role)
  	@user = recipient
  	@role = role
  	mail(to: recipient.email, subject: "Welcome to PropMan!")
  end
end
