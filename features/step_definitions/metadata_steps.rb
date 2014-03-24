def new_metadata_form(metadata, value)
  within(".new_content") do
    fill_in "Add New #{metadata}", with: value
    click_button "Add"
  end
end

def edit_metadata_form(metadata, value)
  within("#edit_#{metadata}") do
    fill_in "#{metadata.capitalize} name", with: value
    click_button "Save #{metadata.capitalize}"
  end
end

def edit_table_row_for(id)
  within("tr[data-id='#{id}']") do
    click_link "Edit"
  end
end

When /^I complete the new (.*) form$/ do |metadata|
  new_metadata_form(metadata.capitalize, "New #{metadata}")
end

When /^I blank out the new (.*) form$/ do |metadata|
  new_metadata_form(metadata.capitalize, "")
end

When /^I complete the edit (.*) form$/ do |metadata|
  edit_metadata_form(metadata, "Edit Engineering")
end

When /^I blank out the edit (.*) form$/ do |metadata|
  edit_metadata_form(metadata, "")
end

When /^I click edit for a category$/ do
  edit_table_row_for(@category.id)
end
