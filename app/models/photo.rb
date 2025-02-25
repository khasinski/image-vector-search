class Photo < ApplicationRecord
  has_one_attached :file

  def similar
    Photo.all
  end

  def self.by_description(description)
    Photo.all
  end

  def self.by_image(image)
    Photo.all
  end

  def file_path
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end
end
