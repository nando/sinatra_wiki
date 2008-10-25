# Commonly used webrat steps
# http://github.com/brynary/webrat
When /^I press ["']?([^"']+)["']?$/i do |button|
  clicks_button(button)
end

When /^I (try)?(?: to )?follow ["']?([^"']+)["']? in ["']?([^"']+)["']?$/ do |try, link, selector|
  try_if_try(try, "clicks_link_within('#{selector}', '#{link}')")
end

When /^I (try)?(?: to )?follow ["']?([^"']+)["']?$/i do |try, link|
  try_if_try(try, "clicks_link('#{link}')")
end

When /^I fill in ["']?([^"']+)["']? with ["']?([^"']+)["']?$/i do |field, value|
  fills_in(field, :with => value) 
end

When /^I select ["']?([^"']+)["']? from ["']?([^"']+)["']?$/i do |value, field|
  selects(value, :from => field) 
end

When /^I check ["']?([^"']+)["']?$/i do |field|
  checks(field) 
end

When /^I uncheck ["']?([^"']+)["']?$/i do |field|
  unchecks(field) 
end

When /^I choose ["']?([^"']+)["']?$/i do |field|
  chooses(field)
end

When /^I attach the file at ["']?([^"']+)["']? to ["']?([^"']+)["']? $/i do |path, field|
  attaches_file(field, path)
end

When /^I (try)?(?: to )?visit ["']?([^"']+)["']?$/i do |try, place| 
  try_if_try try, "visits '#{feature_place_to_app_path(place)}'"
end

