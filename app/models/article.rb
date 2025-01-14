class Article < ApplicationRecord
  include ArticleImagesHandler
  include ContentValidationHandler

  belongs_to :category, validate: true
  has_and_belongs_to_many :tags, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :article_images, dependent: :destroy

  validates :title, length: {
    in: 5..40,
    too_short: 'kısmı en az %<count>s uzunlukta olmalıdır!',
    too_long: 'kısmı en fazla %<count>s uzunlukta olabilir!'
  }, uniqueness: { case_sensitive: false, message: 'kısmı eşsiz olmalıdır!' }

  validates :header,
            length: {
              in: 10..1000,
              too_short: 'kısmı en az %<count>s karakter olmalıdır!',
              too_long: 'kısmı en fazla %<count>s karakter uzunluğunda olabilir!'
            }

  # Content validation
  validate :json_validation

  before_save :reorganize_title
end
