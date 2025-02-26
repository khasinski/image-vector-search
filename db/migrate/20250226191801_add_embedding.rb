class AddEmbedding < ActiveRecord::Migration[8.0]
  def change
    add_column :photos, :embedding, :binary
  end
end
