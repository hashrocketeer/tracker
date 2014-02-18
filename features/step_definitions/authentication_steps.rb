def sign_in(email, password)
  fill_in "Email Address", with: email
  fill_in "Password", with: password

  click_button "Sign In"
end

When "I submit valid credentials" do
  sign_in("awong@example.com", "password")
end

When "I submit invalid credentials" do
  sign_in("a_wrong@example.com", "password")
end
