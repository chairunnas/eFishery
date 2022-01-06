$login_page = LoginPage.new
$email_user = ENV['EMAIL_USER']
$password_user = ENV['PASSWORD_USER']
Given('user logged in with email') do
  $landing_page.click_sign_in
  $login_page.login_user_with_email
end