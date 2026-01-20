class EmbedPhotoJob < ApplicationJob
  queue_as :default

  def perform(photo)
    embedding = $image_embedding.call(photo.file_path)
    photo.update(embedding: embedding)
  end
end
