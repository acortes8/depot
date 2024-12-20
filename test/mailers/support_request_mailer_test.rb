require "test_helper"

class SupportRequestMailerTest < ActionMailer::TestCase
  test "respond" do
    mail = SupportRequestMailer.respond(support_requests(:one))
    assert_equal "Re: ", mail.subject
    assert_equal ["dave@example.com"], mail.to
    assert_equal [Rails.application.credentials.dig(:smtp, :user_name)],
      mail.from
  end

end
