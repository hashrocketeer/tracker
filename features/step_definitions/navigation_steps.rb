Given "I am on the home page" do
  visit "/"
end

Given "I am on the new trainee page" do
  current_path.should == "/trainees"
end
