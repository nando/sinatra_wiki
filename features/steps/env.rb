#require 'ruby-debug'
appdir = File.dirname(__FILE__) + '/../../'
sinatrapp = appdir + 'sinatra_wiki'
$0 = sinatrapp + '.rb' # otherwise Sinatra will look for views in the wrong place
require appdir + 'requires'
require 'spec'
require 'webrat/sinatra/sinatra_session'
require 'sinatra/test/common'
require File.dirname(__FILE__) + '/feature_step_helper'
Webrat::SinatraSession.send(:include, FeatureStepHelper)

require sinatrapp

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
