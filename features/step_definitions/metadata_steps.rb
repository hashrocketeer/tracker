When /^I complete the new (.*) form$/ do |metadata|
  within(".new_content") do
    fill_in "Add New #{metadata.capitalize}", with: "New #{metadata}"
    click_button "Add"
  end
end
