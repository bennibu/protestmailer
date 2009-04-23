class Mailer < ActionMailer::Base
  
  def verification(protest_mail)
    subject    "[ausgekohlt!] Bitte bestätige Deine Teilnahme"
    recipients protest_mail.activist.email
    from       APP_CONFIG[:mail_sender]
    
    body       :protest_mail => protest_mail,
               :activist => protest_mail.activist,
               :link => "#{APP_CONFIG[:base_url]}/protest/verify?token=#{protest_mail.token}"
  end

  def protest_mail(protest_mail, recipient)
    subject    protest_mail.subject
    recipients recipient
    from       "#{protest_mail.activist.name} <#{protest_mail.activist.email}>"
    headers    'Sender' => APP_CONFIG[:mail_sender]
    
    body       :protest_mail => protest_mail,
               :activist => protest_mail.activist
  end

  def protest_copy(protest_mail)
    subject    "[ausgekohlt!] Vielen Dank für Deine Teilnahme"
    recipients protest_mail.activist.email
    from       APP_CONFIG[:mail_sender]

    body       :protest_mail => protest_mail,
               :activist => protest_mail.activist
  end

  def invitation(invitation, recipient)
    subject       APP_CONFIG[:invitation]['subject']
    recipients    recipient
    from          APP_CONFIG[:mail_sender]

    body          :from_name => invitation.sender_name.gsub(/<\/?[^>]*>/,  ""),
                  :from_email => invitation.sender_email.gsub(/<\/?[^>]*>/,  ""),
                  :message => invitation.message.gsub(/<\/?[^>]*>/,  "")
  end

end
