class PopMailer < ActionMailer::Base
  default from: "pop@ime.com"
  
  def termos_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Seja bem vindo ao POP!!')
  end

end
