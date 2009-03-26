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

require 'test_helper'

class ActivistTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
