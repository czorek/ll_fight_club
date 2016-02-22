# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "public/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process resize_to_fit: [250, 300]

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
