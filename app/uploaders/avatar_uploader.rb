class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env == "test"
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "https://www.mypraize.com/static/images/defaults/profile-images/default-profile.gif"
  end

  version :large_avatar do
    # returns a 150x150 image
    process resize_to_fill: [500, 500]
  end
  version :medium_avatar do
    # returns a 50x50 image
    process resize_to_fill: [50, 50]
  end
  version :small_avatar do
    # returns a 35x35 image
    process resize_to_fill: [35, 35]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
