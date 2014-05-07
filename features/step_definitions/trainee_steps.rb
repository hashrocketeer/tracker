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

When "I search for that trainee" do
  step %Q{I search for trainees by "First name" with "#{@trainee.first_name}"}
end

Then "only that trainee is displayed" do
  search_results_for "Fry", "Philip"
end

When "I submit the trainee details" do
  within("#new_trainee") do
    fill_in "First name", with: "Johnny"
    fill_in "Last name", with: "Bluejeans"
    fill_in "Badge ID", with: "1234"
    fill_in "Employee #", with: "5678"

    fill_in "Phone", with: "555-1212"
    fill_in "Home phone", with: "555-1313"
    fill_in "Fax", with: "555-1414"

    select "My Department", from: "Department"
    select "My Category", from: "Category"
    select "My Job Title", from: "Job Title"

    fill_in "Address", with: "123 Sesame Street, New York, NY 10023"

    fill_in "Birth date", with: "/21/2012"
    fill_in "Hire date", with: "12/21/2012"
    fill_in "Termination date", with: "12/21/2012"

    fill_in "Blood type", with: "O+"
    fill_in "Medical alerts/allergies", with: "None"

    click_button "Save Trainee"
  end
end

When "I edit that trainee's details" do
  click_link "Edit"

  within("#edit_trainee") do
    fill_in "First name", with: "Johnny"
    fill_in "Last name", with: "Bluejeans"
    fill_in "Badge ID", with: "1234"
    fill_in "Employee #", with: "5678"

    click_button "Save Trainee"
  end
end

Then /^I see a confirmation that the trainee was (added|saved)$/ do |action|
  within(".flash") do
    page.should have_content("You successfully #{action} a trainee")
  end
end

Given "the company has a trainee" do
  @trainee = Fabricate(:trainee, company: @user.company)
end

Then "I see that trainee in search results" do
  step 'I search for trainees by "First name" with "Johnny"'
  search_results_for "Johnny", "Bluejeans"
end
