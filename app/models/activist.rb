# == Schema Information
# Schema version: 20090326120345
#
# Table name: activists
#
#  id         :integer         not null, primary key
#  forename   :string(255)
#  surename   :string(255)
#  street     :string(255)
#  zipcode    :string(255)
#  city       :string(255)
#  email      :string(255)
#  newsletter :boolean
#  created_at :datetime
#

class Activist < ActiveRecord::Base
  
  EMAIL_NAME_REGEX  = '[\w\.%\+\-]+'
  DMOAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'
  DOMAIN_TLD_REGEX  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'
  EMAIL_REGEX       = /\A#{EMAIL_NAME_REGEX}@#{DMOAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}\z/i


  validates_presence_of :forename, :surename, :street, :zipcode, :city, :email
  validates_length_of :forename, :surename, :street, :zipcode, :city, :email, :in => 2..255
  validates_format_of :email, :with => EMAIL_REGEX, :message => "sollte wie eine gültige Email-Adresse aussehen."

  def name
    "#{forename} #{surename}"
  end

end
