class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  else
    include Cloudinary::CarrierWave
  end

  def default_url(*args)
    # "/assets/images/fallback/" + [thumb, "ghost.png"].compact.join('_')
    # "/fallback/ghost.png"
    ActionController::Base.helpers.asset_path("fallback/" + [version_name, "ghost.png"].compact.join('_'))
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
