When /^I follow "(.*?)"$/ do |link_text|
  click_link link_text
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content text
end
