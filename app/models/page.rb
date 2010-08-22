# == Schema Information
#
# Table name: pages
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  body        :text
#  cached_slug :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  homepage    :boolean         default(FALSE)
#  show_title  :boolean         default(TRUE)
#

class Page < ActiveRecord::Base

  has_friendly_id :title, :use_slug => true, :approximate_ascii => true,
    :ascii_approximation_options => :german

  validates_presence_of :title, :body
  validates_length_of :title, :body, :minimum => 3


end
