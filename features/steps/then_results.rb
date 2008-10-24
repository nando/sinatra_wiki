# We wanna see you right
Then /^I should see ['|"]?([^'"]+)['|"]?$/i do |text|
  response.body.should =~ /#{text}/m
end

Then /^I should not see "(.*)"$/i do |text|
  response.body.should_not =~ /#{text}/m
end

Then /^I should see a link to "(.*)"$/i do |text|
  response.body.should =~ /href="\/#{text}"/m
end

Then /^I get a (\d\d\d) error$/i do |code|
  response.status.should == code.to_i
end

Then /^the page ['|"]?([^'"]+)['|"]? DOES (\w*) ?exist$/i do |slug, negation|
  page = Page.new(slug)
  page.exists?.should ( negation.blank? ? be_true : be_false)
  page.harakiri unless page.exists?
end

