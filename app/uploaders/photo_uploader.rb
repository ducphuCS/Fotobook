class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Cloudinary::CarrierWave

  if Rails.env.production
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :avatar do
    process :resize_to_fill => [32, 32]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
