appdir = File.dirname(__FILE__) + '/../../'
sinatrapp = appdir + 'sinatra_wiki'

# Set $0 (otherwise Sinatra will look for views in the wrong place)
$0 = sinatrapp + '.rb' 

require 'spec'
[:webrat, :sinatra].each do |libdir|
  $LOAD_PATH.unshift File.expand_path("#{appdir}lib/#{libdir}/lib")
end
require 'webrat/sinatra/sinatra_session'
require 'sinatra/test/common'
require sinatrapp

World do
  Webrat::SinatraSession.new
end
