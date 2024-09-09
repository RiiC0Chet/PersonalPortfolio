class ContactMailer < ApplicationMailer
  default to: "jlricoramos@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Own Portfolio')
  end

  def contact_email
  
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]
    
    mail(from: @email, subject: @subject, body: @messag)
  
  end

  def reply_contact_email
    
    @email = params[:email]
    @subject = params[:subject]
    @message = params[:message]

    mail(from: 'jlricoramos@gmail.com',to: @email, subject: @subject, body: @message)do |format|
    format.html { render 'reply_contact_email' }
  end
  
  end
  
end