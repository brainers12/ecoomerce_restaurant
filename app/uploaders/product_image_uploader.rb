class ProductImageUploader < CarrierWave::Uploader::Base

    
    include CarrierWave::RMagick
    # include CarrierWave::MiniMagick
  
    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog
  
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  
  
    # Create different versions of your uploaded files:
    version :tiny do
      process resize_to_fit: [100, 100]
    end
  
    version :thumb do
      process resize_to_fit: [300, 300]
    end
  
    def extension_white_list
      %w(jpg jpeg png)
    end
  
  end