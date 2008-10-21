# We wanna see you right
Then /^I should see "(.*)"$/ do |text|
  response.body.should =~ /#{text}/m
end

Then /^I should not see "(.*)"$/ do |text|
  response.body.should_not =~ /#{text}/m
end

Then /^I should see a link to "(.*)"$/ do |text|
  response.body.should =~ /href="\/#{text}"/m
end
