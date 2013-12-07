require 'flickraw'

class ImageService
  PHOTO_PATH = "martini.jpeg"

  def self.singleton
    @singleton ||= ImageService.new
  end

  def self.request_authentication
    token = flickr.get_request_token
    auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

    puts "Open this url in your process to complete the authication process : #{auth_url}"
    puts "Copy here the number given when you complete the process."
    verify = gets.strip

    flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
    

    puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
  rescue FlickRaw::FailedResponse => e
    puts "Authentication failed : #{e.msg}"
  end

  def initialize
    FlickRaw.api_key = ENV['FLICKRAW_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKRAW_SHARED_SECRET']
    #FlickRaw.secure = true

    flickr.access_token = ENV['FLICKRAW_ACCESS_TOKEN']
    flickr.access_secret = ENV['FLICKRAW_ACCESS_SECRET']
  end
 
  def login
    flickr.test.login
  end

  def upload(photo_path, opts={})
    {description: '', title: '', safety_level: 3, hidden: true}.merge(opts)
    flickr.upload_photo photo_path, opts
  end

  def get_image_url(image_id)
    info = flickr.photos.getInfo(:photo_id => image_id)
    FlickRaw.url_b(info)
  end
end