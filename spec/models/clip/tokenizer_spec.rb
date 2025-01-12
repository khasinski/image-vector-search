require 'rails_helper'

RSpec.describe CLIP::Tokenizer do
  let(:tokenizer) { described_class.new }

  describe '#bytes_to_unicode' do
    it 'returns a hash mapping bytes to Unicode strings' do
      expect(tokenizer.bytes_to_unicode).to be_a(Hash)
    end
  end

  describe '#basic_clean' do
    it 'returns the input text' do
      expect(tokenizer.basic_clean("hello")).to eq("hello")
    end
  end

  describe '#whitespace_clean' do
    it 'returns the input text with whitespace cleaned' do
      expect(tokenizer.whitespace_clean("hello  world")).to eq("hello world")
    end
  end

  describe '#bpe' do
    it 'returns the input token after applying byte pair encoding' do
      expect(tokenizer.bpe("hello")).to eq("hello</w>")
    end
  end

  describe '#encode' do
    it 'returns a list of token ids' do
      expect(tokenizer.encode("hello")).to be_an(Array)
    end
  end
end
