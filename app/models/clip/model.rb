class CLIP::Model
  attr_reader :text_model, :image_model, :tokenizer, :image_preprocessor

  def initialize(
    textual_model_path: "model/textual.onnx",
    visual_model_path: "model/visual.onnx",
    tokenizer: CLIP::Tokenizer.new,
    image_preprocessor: CLIP::ImagePreprocessor.new
  )
    @text_model = OnnxRuntime::Model.new(textual_model_path)
    @image_model = OnnxRuntime::Model.new(visual_model_path)
    @tokenizer = tokenizer
    @image_preprocessor = image_preprocessor
  end

  def encode_text(text)
    tokens = tokenizer.encode(text)
    text_model.predict({ input: [tokens] })["output"].first
  end

  def encode_image(image)
    image = image_preprocessor.preprocess(image).to_a
    image_model.predict({ input: [image] })["output"].first
  end
end
