When(/^I submit the registration details$/) do
  within("//*[@id='new_user']") do
    fill_in 'Company', with: "Planet Express"

    fill_in 'First', with: "Phillip J."
    fill_in 'Last', with: "Fry"

    fill_in 'Email Address', with: "fry@planetexpress.com"
    fill_in 'Password', with: "password"
    fill_in 'Confirm Password', with: "password"

    click_button 'Register'
  end
end

When(/^I submit a duplicate email for registration$/) do
  within("//*[@id='new_user']") do
    fill_in 'Email Address', with: "awong@example.com"
    fill_in 'Password', with: "password"
    fill_in 'Confirm Password', with: "password"

    click_button 'Register'
  end
end
