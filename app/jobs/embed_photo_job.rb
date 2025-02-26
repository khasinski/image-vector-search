class EmbedPhotoJob < ApplicationJob
  queue_as :default

  def perform(photo)
    photo_path = ActiveStorage::Blob.service.path_for(photo.file.key)
    embedding = $image_embedding.call(photo_path)
    photo.update(embedding: embedding)
  end
end
