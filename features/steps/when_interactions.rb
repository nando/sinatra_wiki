# Commonly used webrat steps
# http://github.com/brynary/webrat
When /^I press "(.*)"$/ do |button|
  clicks_button(button)
end

When /^I follow ["|'](.*)["|'] in ["|'](.*)["|']$/ do |link, selector|
  clicks_link_within(selector, link)
end

When /^I follow ["|']([^ ]*)["|']$/ do |link|
  clicks_link(link)
end

When /^I fill in "(.*)" with "(.*)"$/ do |field, value|
  fills_in(field, :with => value) 
end

When /^I select "(.*)" from "(.*)"$/ do |value, field|
  selects(value, :from => field) 
end

When /^I check "(.*)"$/ do |field|
  checks(field) 
end

When /^I uncheck "(.*)"$/ do |field|
  unchecks(field) 
end

When /^I choose "(.*)"$/ do |field|
  chooses(field)
end

When /^I attach the file at "(.*)" to "(.*)" $/ do |path, field|
  attaches_file(field, path)
end

When /^I visit (.*)$/ do |place| 
  case place.downcase
  when 'the home' then visits "/"
  else visits place
  end
end

