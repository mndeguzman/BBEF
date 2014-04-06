require './app/services/image_service'

namespace :flickr do
  desc 'Generate access tokens for your flickr account'
  task :setup do
    ImageService.request_authentication
  end
end