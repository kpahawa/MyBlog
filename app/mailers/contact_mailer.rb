class ContactMailer < ActionMailer::Base
  default from: "kpahawa@gmail.com"

  def sample_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: 'Sample Email')
  end

end
