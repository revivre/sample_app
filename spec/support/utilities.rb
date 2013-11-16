include ApplicationHelper
def sign_in(user, options={})
  if options[:no_capybara]
    # Capybara$B$r;HMQ$7$F$$$J$$>l9g$K$b%5%$%s%$%s$9$k!#(B
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
