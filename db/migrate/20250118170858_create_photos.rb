class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.binary :embedding
      t.timestamps
    end
  end
end
