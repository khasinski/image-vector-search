if Photo.count == 0
  puts "Creating photos..."

  Dir.glob('sample-images/images/image-*.jpg').each do |image_path|
    File.open(image_path) do |file|
      photo = Photo.new
      photo.file.attach(io: file, filename: File.basename(image_path))
      photo.save!
    end
  end
else
  puts "Photos already exist."
  exit
end
