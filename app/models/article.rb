class Article < ApplicationRecord
  include ArticleImagesHandler

  belongs_to :category, validate: true
  has_and_belongs_to_many :tags
  has_one_attached :image
  has_many :article_images

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

  # validates :content, presence: { message: 'kısmı boş bırakılamaz!' }
  before_save :reorganize_title
end
