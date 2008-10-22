require 'requires'

configure do
  @config = YAML::load(File.read('config.yml')).to_hash.each do |k,v|
    set k, v
  end
end

configure :development do
  %x(rake expire_cache)
  set :cache_enabled, false
end

before do
  content_type 'text/html', :charset => 'utf-8'
  @page = Page.new("home") # Default page
end

get '/' do
  @pages = Page.pages
  cache erb(:home)
end
get '/:slug' do
  @page = Page.new(params[:slug])
  if @page.is_new
    redirect "/#{@page.name}/edit"
  else
    @content = @page.html
    cache erb(:page)
  end
end
get '/:slug/edit' do
  auth
  @page = Page.new(params[:slug])
  erb :edit
end
post '/:slug/edit' do
  auth
  nice_title = Slugalizer.slugalize(params[:title])
  @page = Page.new(nice_title)
  @page.content = params[:body]
  expire_cache "/"
  expire_cache "/#{nice_title}"
  redirect "/#{nice_title}"
end
get '/:slug/destroy' do
  auth
  Page.destroy(params[:slug])
  redirect "/"
end

get '/base.css' do
  cache sass(:base)
end
