# == Schema Information
# Schema version: 20090326120345
#
# Table name: activists
#
#  id         :integer         not null, primary key
#  sex        :integer(1)      default(0)
#  title      :string(255)
#  forename   :string(255)
#  surename   :string(255)
#  street     :string(255)
#  zipcode    :string(255)
#  city       :string(255)
#  email      :string(255)
#  job        :string(255)
#  newsletter :boolean
#  created_at :datetime
#

class Activist < ActiveRecord::Base

  EMAIL_NAME_REGEX  = '[\w\.%\+\-]+'.freeze
  DMOAIN_HEAD_REGEX = '(?:[A-Z0-9\-]+\.)+'.freeze
  DOMAIN_TLD_REGEX  = '(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)'.freeze
  EMAIL_REGEX       = /\A#{email_name_regex}@#{domain_head_regex}#{domain_tld_regex}\z/i

  validates_format_of :email, :with => EMAIL_REGEX, :message => "sollte wie eine gültige Email-Adresse aussehen."
end
