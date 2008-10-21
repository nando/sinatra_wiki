[:webrat, :sinatra, 'sinatra-cache'].each do |libdir|
  $LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/lib/#{libdir}/lib/")
end

%w(rubygems erb rdiscount yaml thin digest/sha1 haml sinatra cache).each do |lib|
  require lib
end

Dir["lib/*.rb"].each do |lib|
  require lib
end
