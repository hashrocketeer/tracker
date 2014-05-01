def search_results_for(first, last)
  within('#main > div > table > tbody') do
    page.all("tr").count.should == 1
    page.should have_content first
    page.should have_content last
  end
end

When /^I search for trainees by "(.*)" with "(.*)"$/ do |field, value|
  within("#sidebar") do
    fill_in field, with: value
    click_button "Search"
  end
end

Then "only that trainee is displayed" do
  search_results_for "Fry", "Philip"
end

When "I submit the trainee details" do
  within("#new_trainee") do
    fill_in "First name", with: "Johnny"
    fill_in "Last name", with: "Bluejeans"

    click_button "Save Trainee"
  end
end

Then "I see a confirmation that the trainee was added" do
  within(".flash") do
    page.should have_content("You successfully added Johnny Bluejeans")
  end
end

Then "I see that trainee in search results" do
  step 'I search for trainees by "First name" with "Johnny"'
  search_results_for "Johnny", "Bluejeans"
end
