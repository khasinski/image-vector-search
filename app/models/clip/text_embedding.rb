class CLIP::TextEmbedding
  def initialize(
    tokenizer: Tokenizers.from_pretrained("M-CLIP/XLM-Roberta-Large-Vit-B-32"),
    model_path: "./multilingual_model/textual.onnx"
  )
    @tokenizer = tokenizer
    @model = OnnxRuntime::Model.new(model_path)
  end

  def call(text)
    tensor = tokenizer.encode(text).ids
    attention_mask = Array.new(tensor.size, 1)
    model.predict({ input_ids: [tensor], attention_mask: [attention_mask] })["output"].first
  end

  private

  attr_reader :tokenizer, :model
end
