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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
