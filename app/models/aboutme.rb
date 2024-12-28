class Aboutme < ApplicationRecord
  has_one_attached :profile_photo

  def get_image_url
    return nil if profile_photo.nil? || profile_photo.attachment.nil?

    Rails.application.routes.url_helpers.rails_blob_url(profile_photo, only_path: true)
  end
end
