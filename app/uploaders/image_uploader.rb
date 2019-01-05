class ImageUploader < CarrierWave::Uploader::Base
    include Cloudinary::CarrierWave

    # Remove everything else
end
