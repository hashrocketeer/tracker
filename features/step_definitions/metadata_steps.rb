def new_metadata_form(metadata, value)
  within(".new_content") do
    fill_in "Add New #{metadata}", with: value
    click_button "Add"
  end
end

def edit_metadata_form(metadata, value)
  within("#edit_#{metadata.parameterize("_")}") do
    fill_in "#{metadata.capitalize} name", with: value
    click_button "Save #{metadata.capitalize}"
  end
end

def table_row_action_for(id, action)
  within("tr[data-id='#{id}']") do
    click_link action
  end
end

def delete_modal_action(action)
  within('#confirm_delete') do
    click_link(action)
  end
end

Given "the company has metadata" do
  [:department, :category, :job_title].each do |metadata|
    Fabricate(metadata, company: @user.company)
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

When /^I click "(.*)" for a category$/ do |action|
  table_row_action_for(@category.id, action)
end

When /^I click "(.*)" for a department/ do |action|
  table_row_action_for(@department.id, action)
end

When /^I click "(.*)" for a job title/ do |action|
  table_row_action_for(@job_title.id, action)
end

When "I confirm the delete" do
  delete_modal_action("Yes")
end

When "I cancel the delete" do
  delete_modal_action("No")
end
