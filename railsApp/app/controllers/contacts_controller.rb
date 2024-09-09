# app/controllers/contacts_controller.rb
class ContactsController < ApplicationController
  def create
    ContactMailer.with(email: params[:email], subject: params[:subject], message: params[:message]).contact_email.deliver_now
    ContactMailer.with(email: params[:email], subject: 'Thanks for contacting me :)', message: 'I have received your message and will reply as soon as possible.
      Best regards.').reply_contact_email.deliver_now
    redirect_to root_path
  end
end