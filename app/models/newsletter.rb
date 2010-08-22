# == Schema Information
#
# Table name: newsletters
#
#  id         :integer         not null, primary key
#  subject    :string(255)
#  content    :text
#  send_at    :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Newsletter < ActiveRecord::Base

  validates_presence_of :subject, :content
  
  def content_html
    BlueCloth.new(content).to_html
  end

  def content_plain
    content
  end

  def replace_name(text, name = "Magda Mustermensch")
    text.gsub(/\{\{name\}\}/, name)
  end

  def html
    replace_name(content_html)
  end

  def plain
    replace_name(content_plain)
  end
  
end
