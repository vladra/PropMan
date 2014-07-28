class Notififier < ActionMailer::Base
  default from: "'PropMan' info@propman-production.herokuapp.com"

  def welcome(recipient, role)
  	@user = recipient
  	@role = role
  	mail(to: recipient.email)
  end
end
