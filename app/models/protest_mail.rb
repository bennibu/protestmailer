# == Schema Information
# Schema version: 20090326120345
#
# Table name: protest_mails
#
#  id          :integer         not null, primary key
#  subject     :string(255)
#  body        :text
#  activist_id :integer
#  token       :string(255)
#  send_at     :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

require 'digest/sha1'

class ProtestMail < ActiveRecord::Base
  belongs_to :activist

  validates_presence_of :subject, :body, :token
  validates_length_of :subject, :in => 10..255
  validates_length_of :body, :minimum => 10

  before_validation_on_create :set_token

  accepts_nested_attributes_for :activist

  def deliver_protest!
    APP_CONFIG[:protest_mail]["recipients"].each do |recipient|
       Mailer.deliver_protest_mail(self, recipient)
    end
    Mailer.deliver_protest_copy(self)
    self.update_attribute(:send_at, Time.now)
  end

  protected

  def set_token
    self.token = secure_digest(Time.now, (1..10).map{ rand.to_s })
  end

  def secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end
end
