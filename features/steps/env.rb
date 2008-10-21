appdir = File.dirname(__FILE__) + '/../../'
sinatrapp = appdir + 'sinatra_wiki'

# Set $0 (otherwise Sinatra will look for views in the wrong place)
$0 = sinatrapp + '.rb' 

require appdir + 'requires'
require 'spec'
require 'webrat/sinatra/sinatra_session'
require 'sinatra/test/common'
require sinatrapp

World do
  Webrat::SinatraSession.new
end
