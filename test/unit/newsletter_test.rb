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

require 'test_helper'

class NewsletterTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
