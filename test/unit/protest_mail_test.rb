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

require 'test_helper'

class ProtestMailTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
