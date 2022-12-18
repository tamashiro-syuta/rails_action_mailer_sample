require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "welcome" do
    email = UserMailer.with(to: "sample@example.com", name: "sample").welcome
    # メールが送信キューに保存されるかテスト
    assert_equal ["from@example.com"], email.from
    assert_equal ["sample@example.com"], email.to
    assert_equal "登録完了", email.subject
    assert_includes email.text_part.decoded, "sample"
    assert_includes email.html_part.decoded, "sample"
  end
end
