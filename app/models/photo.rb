class Photo < ApplicationRecord
  has_neighbors :embedding, dimensions: 512
  has_one_attached :file

  after_commit :enqueue_create_embedding_job

  def similar
    nearest_neighbors(:embedding, distance: :cosine)
  end

  def self.by_description(description)
    text_embedding = $clip.encode_text(description)
    Photo.nearest_neighbors(:embedding, text_embedding, distance: :cosine)
  end

  def self.by_image(image)
    image_embedding = $clip.encode_image(image.path)
    Photo.nearest_neighbors(:embedding, image_embedding, distance: :cosine)
  end

  def file_path
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end

  private

  def enqueue_create_embedding_job
    CreateEmbeddingJob.perform_later(self.id) if file.attached?
  end
end
