# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  location    :string(255)
#  title       :string(255)
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#  cached_slug :string(255)
#

class Post < ActiveRecord::Base

  has_friendly_id :title, :use_slug => true, :approximate_ascii => true,
    :ascii_approximation_options => :german

  default_scope :order => 'created_at DESC'
  
  validates_presence_of :title, :body

  def year
    created_at.strftime "%Y"
  end

  def month
    created_at.strftime "%m"
  end

  def day
    created_at.strftime "%d"
  end
end
