FactoryBot.define do
  factory :photo do
    # CC BY-SA 4.0 https://commons.wikimedia.org/wiki/Category:Public_domain#/media/File:Vu_depuis_le_phare.jpg
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'assets', 'test.jpg'), 'image/jpeg') }
  end
end
