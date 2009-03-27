require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "verification" do
    @expected.subject = 'Mailer#verify'
    @expected.body    = read_fixture('verify')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_verify(@expected.date).encoded
  end

  test "protest_mail" do
    @expected.subject = 'Mailer#protest_mail'
    @expected.body    = read_fixture('protest_mail')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_protest_mail(@expected.date).encoded
  end

end
