require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = {
  access_key_id: Rails.application.secrets.spaces_key,
  secret_access_key: Rails.application.secrets.spaces_secret,
  bucket: Rails.application.secrets.spaces_bucket,
  endpoint: Rails.application.secrets.spaces_endpoint,
  region: Rails.application.secrets.spaces_region
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(
    prefix: Rails.application.secrets.spaces_cache_prefix,
    upload_options: {acl: "public-read"},
    **s3_options
  ),
  store: Shrine::Storage::S3.new(
    prefix: Rails.application.secrets.spaces_store_prefix,
    upload_options: {acl: "public-read"},
    **s3_options
  )
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms

# TODO: may be able to remove this!!
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
