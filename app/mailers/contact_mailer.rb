class ContactMailer < ActionMailer::Base
  default from: "ユーザーからのお問い合わせ"
  default to: "girujinia@gmail.com"
     
  def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせを承りました')
  end
     
end