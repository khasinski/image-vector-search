class CLIP::TextEmbedding
  MODEL_DIR = Rails.root.join("multilingual_model")

  def initialize(
    tokenizer: Tokenizers.from_file(Rails.root.join("config/tokenizers/xlm-roberta-large.json")),
    model_path: MODEL_DIR.join("textual.onnx")
  )
    @tokenizer = tokenizer
    # ONNX model with external data requires loading from the model's directory
    @model = Dir.chdir(MODEL_DIR) { OnnxRuntime::Model.new(model_path) }
  end

  def call(text)
    tensor = tokenizer.encode(text).ids
    attention_mask = Array.new(tensor.size, 1)
    model.predict({ input_ids: [ tensor ], attention_mask: [ attention_mask ] })["output"].first
  end

  private

  attr_reader :tokenizer, :model
end
