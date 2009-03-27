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

end
