require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
  access_key_id: ENV["SPACES_KEY"],
  secret_access_key: ENV["SPACES_SECRET"],
  bucket: ENV["SPACES_BUCKET"],
  endpoint: ENV["SPACES_ENDPOINT"],
  region: ENV["SPACES_REGION"]
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: ENV["SPACES_CACHE_PREFIX"], upload_options: {acl: "public-read"}, **s3_options),
  store: Shrine::Storage::S3.new(prefix: ENV["SPACES_STORE_PREFIX"], upload_options: {acl: "public-read"}, **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms
