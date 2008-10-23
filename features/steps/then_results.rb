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

Then /^I get a (\d\d\d) error when I visit ['|"]?(.*)['|"]?$/i do |code, place|
  visits feature_place_to_app_path(place) rescue nil  
  response.status.should == code.to_i
end

Then /^I get a (\d\d\d) error when I follow ['|"]?([^'"]+)['|"]? in ["|'](.*)["|']$/i do |code, link, selector|
  clicks_link_within(selector, link) rescue nil 
  response.status.should == code.to_i
end

Then /^the page ['|"]?([^'"]+)['|"]? DOES (\w*) ?exist$/i do |slug, negation|
  page = Page.new(slug)
  page.exists?.should ( negation.blank? ? be_true : be_false)
  page.harakiri unless page.exists?
end

