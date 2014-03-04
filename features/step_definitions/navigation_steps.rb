Given /^I am on the (.*) page$/ do |page_text|
  visit "/"
  click_link page_text.capitalize unless page_text == "home"
end

Given "I am on the new trainee page" do
  current_path.should == "/trainees"
end
