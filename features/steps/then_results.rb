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

Then /^I get a (\d\d\d) error when I visit ['|"]?(.*)['|"]?$/ do |code, place|
  visits feature_place_to_app_path(place) rescue nil  
  response.status.should == code.to_i
end


