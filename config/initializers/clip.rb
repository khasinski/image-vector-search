ActiveSupport.on_load(:after_initialize) do
  # $clip = CLIP::Model.new
  $clip = Clip::MultilingualModel.new
end
