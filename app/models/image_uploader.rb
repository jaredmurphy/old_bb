require "image_processing/mini_magick"

class ImageUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  process(:store) do |io, _context|
    versions = { original: io } # retain original

    puts "IMAGE UPLOADER"
    puts "secret"
    puts Rails.application.secrets.process_images

    if Rails.application.secrets.process_images
      io.download do |original|
        pipeline = ImageProcessing::MiniMagick.source(original)

        versions[:large]  = pipeline.resize_to_limit!(800, 800)
        versions[:medium] = pipeline.resize_to_limit!(500, 500)
        versions[:small]  = pipeline.resize_to_limit!(300, 300)
      end
    end

    versions # return hash of processed files
  end
end
