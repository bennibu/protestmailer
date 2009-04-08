class Invitation

  include Validateable

  EMAIL_NAME_REGEX  = '[\w\.%\+\-]+'
  DMOAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'
  DOMAIN_TLD_REGEX  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  EMAIL_REGEX       = /\A#{EMAIL_NAME_REGEX}@#{DMOAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}\z/i

  attr_accessor :recipient_email, :recipients, :sender_name, :sender_email, :message

  def initialize(attributes = {})
    @recipient_email = attributes[:recipient_email] if attributes[:recipient_email]
    @recipients = attributes[:recipients] if attributes[:recipients]
    @sender_name = attributes[:sender_name] if attributes[:sender_name]
    @sender_email = attributes[:sender_email] if attributes[:sender_email]
    @message = attributes[:message] if attributes[:message]
  end

  validates_presence_of :recipient_email, :sender_name, :sender_email, :recipients
  validates_format_of :sender_email, :recipient_email, :with => EMAIL_REGEX
  validate :recipients_addresses

  # Send mails to recipient_email and other recipients
  def send_mails
    recipients.push(recipient_email).each do |email|
      Mailer.deliver_invitation(email, sender_email, sender_name, message)
    end
  end
  
  protected

  # Removes blank recipients addresses and validates format of mail-addresses
  def recipients_addresses
    unless recipients.nil?
      recipients.delete_if { |r| r.empty? }.each do |email|
        unless email =~ EMAIL_REGEX
          self.errors.add(:recipients, "sind nicht gültig") and return
        end
      end
    end
  end
end
