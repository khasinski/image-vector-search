class CLIP::ImageEmbedding
  def initialize(
    image_preprocessor: CLIP::ImagePreprocessor.new,
    model_path: Rails.root.join("model/visual.onnx")
  )
    @image_preprocessor = image_preprocessor
    @model = OnnxRuntime::Model.new(model_path)
  end

  def call(image_path)
    tensor = image_preprocessor.preprocess(image_path).to_a
    model.predict({ input: [ tensor ] })["output"].first
  end

  private

  attr_reader :image_preprocessor, :model
end
