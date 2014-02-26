class Photo < ActiveRecord::Base
  attr_accessible :flickr_id, :small, :thumbnail

  def initialize(path)
    info = ImageService.singleton.upload(path)
    super(info)
  end

  def delete
    ImageService.singleton.delete(flickr_id)
    super
  end
end
