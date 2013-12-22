require 'flickraw'

class ImageService
  PHOTO_PATH = "martini.jpeg"

  def self.singleton
    @singleton ||= ImageService.new
  end

  def self.request_authentication
    token = flickr.get_request_token
    auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

    puts "Open this url to complete the authication process : #{auth_url}"
    puts "Copy here the number given when you complete the process:"
    verify = gets.strip

    flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)

    puts "Access granted for: #{login.username}"
    puts "Set:
     FLICKRAW_ACCESS_TOKEN=#{flickr.access_token}
     FLICKRAW_SHARED_SECRET=#{flickr.access_secret}"
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
    get_image_details upload_image(photo_path, opts)
  end

  def delete(photo_id) 
    flickr.photos.delete(photo_id: photo_id)
  end

  private
  def upload_image(photo_path, opts)
    {description: '', title: '', safety_level: 3, hidden: true}.merge(opts)
    flickr.upload_photo photo_path, opts
  end

  def get_image_details(photo_id)
    info = flickr.photos.getInfo(:photo_id => photo_id)
    { 
      flickr_id: photo_id,    
      thumbnail: FlickRaw.url_t(info),
      small: FlickRaw.url_m(info),
    }  
  end
end