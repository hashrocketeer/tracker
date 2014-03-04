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

When "I am signed in" do
  click_link "Sign In"
  step "I submit valid credentials"
end

Given "I am authenticated" do
  step("I am on the home page")
  step("I am signed in")
end

Given "there is a valid user" do
  Fabricate(:user) {
    first_name "Amy"
    last_name "Wong"
    email "awong@example.com"
    company_name "Planet Express"
   }
end
