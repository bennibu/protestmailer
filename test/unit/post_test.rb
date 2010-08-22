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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
