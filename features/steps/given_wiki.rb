# Steps to get the right wiki groove
Given /^I have a page called "([^"]+)" ?w?i?t?h? ?"?([^"]*)"?$/ do |name, content| 
  Page.new(name).content = content
end

Given /authentication is (.*)/ do |mode|
  set :use_auth, (mode.downcase == 'enabled')
end

Given /username is set to ['|"]?(.*)['|"]? and password is set to ['|"]?(.*)['|"]?/ do |user, pass|
  set :username, user
  set :password, Digest::SHA1.hexdigest(pass)
end

Given /I have logged in with username ['|"]?(.*)['|"]? and password ['|"]?(.*)['|"]?/ do |user, pass|
  basic_auth user, pass
end

