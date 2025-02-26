class CLIP::TextEmbedding
  def initialize(
    tokenizer: CLIP::Tokenizer.new,
    model_path: Rails.root.join("model/textual.onnx")
  )
    @tokenizer = tokenizer
    @model = OnnxRuntime::Model.new(model_path)
  end

  def call(text)
    tensor = tokenizer.encode(text).to_a
    model.predict({ input: [tensor] })["output"].first
  end

  private

  attr_reader :tokenizer, :model
end
