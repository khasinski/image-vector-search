ActiveSupport.on_load(:after_initialize) do
  $image_embedding = CLIP::ImageEmbedding.new
  $text_embedding = CLIP::TextEmbedding.new
end
