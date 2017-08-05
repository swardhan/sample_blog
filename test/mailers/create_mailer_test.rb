require 'test_helper'

class CreateMailerTest < ActionMailer::TestCase
  test "send_create_mail" do
    mail = CreateMailer.send_create_mail
    assert_equal "Send create mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
