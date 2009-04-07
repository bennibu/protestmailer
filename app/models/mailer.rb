class Mailer < ActionMailer::Base
  
  def verification(protest_mail)
    subject    "[Kampagnenname] Bitte bestätige Deine Teilnahme"
    recipients protest_mail.activist.email
    from       APP_CONFIG[:mail_sender]
    
    body       :protest_mail => protest_mail,
               :activist => protest_mail.activist,
               :link => "#{APP_CONFIG[:base_url]}/protest/verify?token=#{protest_mail.token}"
  end

  def protest_mail(protest_mail)
    subject    protest_mail.subject
    recipients APP_CONFIG[:protest_mail]['recipients']
    from       "#{protest_mail.activist.name} <#{protest_mail.activist.email}>"
    
    body       :protest_mail => protest_mail,
               :activist => protest_mail.activist
  end

  def invitation(to_email, from_email, from_name, message)
    subject       APP_CONFIG[:invitation]['subject']
    recipients    to_email
    from          from_email

    body          :from_name => from_name.gsub(/<\/?[^>]*>/,  ""),
                  :message => message.gsub(/<\/?[^>]*>/,  "")
  end

end
