class Project < ApplicationRecord
  include ProjectImagesHandler

  belongs_to :category, validate: true
  has_and_belongs_to_many :tags
  has_one_attached :image
  has_many :project_images

  validate :control_dates

  validates :title,
            uniqueness: { case_sensitive: false, message: 'kısmı daha önceden alınmış!' },
            length: {
              in: 5..20,
              too_short: 'kısmı en az %<count>s karakter olmalıdır!',
              too_long: 'kısmı en fazla %<count>s karakter olabilir!'
            }

  validates :header,
            length: {
              in: 50..100,
              too_short: 'kısmı en az %<count>s karakter olmalıdır!',
              too_long: 'kısmı en fazla %<count>s karakter olabilir!'
            }

  # TODO: content kısmını activerecord_json_validator ile validate et
  # validates :content, presence: { message: 'kısmı boş bırakılamaz!' }

  validates :url,
            presence: { message: 'kısmı boş bırakılamaz!' },
            url: { message: 'kısmına geçerli bir url giriniz!' },
            uniqueness: { case_sensitive: false, message: 'kısmı daha önce kullanılmış!' }

  validates :start_date, :end_date, presence: { message: 'kısmı boş olamaz!' }

  before_save :reorganize_title

  def get_image_url
    return nil if image.blank? || !image.attached?

    Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) if image.attached?
  end

  private

  def control_dates
    return if end_date.blank? || start_date.blank?

    return unless end_date < start_date

    errors.add(:end_date, 'kısmı başlangıç tarihinden sonra olmalıdır!')
  end
end
