# encoding: utf-8

class LogoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_limit => [750, -1]
  version :pin do
    process :resize_to_fit => [236, -1]
  end
  version :board do
    process :resize_to_fit => [216, -1]
  end
  version :thumb do
    process :resize_to_fit => [69, -1]
  end

  def extension_white_list
    %w(jpg jpeg gif png svg)
  end
end
