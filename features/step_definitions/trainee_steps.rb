When /^I search for trainees by "(.*)" with "(.*)"$/ do |field, value|
  within("#sidebar") do
    fill_in field, with: value
    click_button "Search"
  end
end

Then "only that trainee is displayed" do
  within('#main > div > table > tbody') do
    page.all("tr").count.should == 1
    page.should have_content "Fry"
    page.should have_content "Philip"
  end
end
