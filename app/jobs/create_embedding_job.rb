class CreateEmbeddingJob < ApplicationJob
  def perform(photo_id)
    photo = Photo.find(photo_id)
    photo.update_columns(embedding: $clip.encode_image(photo.file_path)) if photo.file.attached?
  end
end
