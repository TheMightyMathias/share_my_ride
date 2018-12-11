require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "tripconfirm" do
    mail = UserMailer.tripconfirm
    assert_equal "Tripconfirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
