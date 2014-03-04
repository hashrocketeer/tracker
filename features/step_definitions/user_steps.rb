When "I add details for a new user" do
  within("//*[@id='new_user']") do
    complete_user_form

    click_button "Add New User"
  end
end

Then "I should see that user in the list" do
  within(".sortable") do
    page.should have_content "Phillip J."
    page.should have_content "Fry"
  end
end
