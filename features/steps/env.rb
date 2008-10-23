appdir = File.dirname(__FILE__) + '/../../'
sinatrapp = appdir + 'sinatra_wiki'

# Set $0 (otherwise Sinatra will look for views in the wrong place)
$0 = sinatrapp + '.rb' 

require appdir + 'requires'
require 'spec'
require 'webrat/sinatra/sinatra_session'
require 'sinatra/test/common'
require sinatrapp

def feature_place_to_app_path(place)
    case place.downcase
    when 'the home' then "/"
    else place
    end
end

#Before(:all)
require 'fileutils'
Page.path_prefix = 'tmp/'
FileUtils.mkdir_p 'tmp/public'

#After(:all)
at_exit do
  FileUtils.rm_rf 'tmp/public'
end

Before do
  FileUtils.rm Dir.glob('tmp/public/*')
end

World do
  Webrat::SinatraSession.new
end
