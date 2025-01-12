require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:photo) { create(:photo) }

  describe '#similar' do
    it 'returns similar photos' do
      expect(photo.similar).to eq([])
    end
  end

  describe '.by_description' do
    it 'returns photos by description' do
      expect(Photo.by_description('a photo')).to eq([])
    end
  end
end
