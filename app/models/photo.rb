class Photo < ApplicationRecord
  has_neighbors :embedding, dimensions: 512

  def similar
    nearest_neighbors(:embedding, distance: :cosine)
  end

  def self.by_description(description)
    text_embedding = CLIP::Model.new.encode_text(description)
    Photo.nearest_neighbors(:embedding, text_embedding, distance: :cosine)
  end
end

