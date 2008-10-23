class Page
  attr_accessor :path, :name, :file, :is_new
  attr_writer :content
  
  # Class methods
  @@path_prefix = ''
  def self.path_prefix= prefix
    @@path_prefix = prefix
  end
 
  def self.pages
    Dir["#{@@path_prefix}public/**/*.txt"].map do |page|
      File.basename(page,".txt")
    end
  end

  def self.destroy(pagename)
    FileUtils.rm "#{@@path_prefix}public/#{pagename}.txt"
  end

  # Instance methods
  def initialize(name)
    self.name = name
    self.path = "#{@@path_prefix}public/#{self.name}.txt"
    self.is_new = !File.exist?(self.path)
  end
  def exists?
    !self.is_new
  end
  def markdown
    File.read(self.path) rescue ''
  end
  def html
    RDiscount.new(File.read(self.path)).to_html.gsub(/\[\[(\w+)\]\]/,'<a href="\1">\1</a>').gsub(/([A-Z]+)([a-z]+)([A-Z]+)\w+/,'<a href="\0">\0</a>')
  end
  def content= txt
    File.open(self.path,"w") do |file|
     file << txt
    end
  end

  def harakiri
    Page.destroy(@name) rescue false
  end
end
