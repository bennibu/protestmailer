class Page < ActiveRecord::Base

  has_friendly_id :title, :use_slug => true, :approximate_ascii => true,
    :ascii_approximation_options => :german

  validates_presence_of :title, :body
  validates_length_of :title, :body, :minimum => 3


end
