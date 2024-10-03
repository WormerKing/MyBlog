class Article < ApplicationRecord
  belongs_to :category, validate: true
  has_and_belongs_to_many :tags

  validates :title, length: {
    in: 5..40,
    too_short: 'kısmı en az %<count>s uzunlukta olmalıdır!',
    too_long: 'kısmı en fazla %<count>s uzunlukta olabilir!'
  }, uniqueness: { case_sensitive: false, message: 'kısmı eşsiz olmalıdır!' }

  validates :header,
            length: {
              in: 10..100,
              too_short: 'kısmı en az %<count>s karakter olmalıdır!',
              too_long: 'kısmı en fazla %<count>s karakter uzunluğunda olabilir!'
            }

  validates :body, length: { minimum: 50, too_short: 'kısmı en az %<count>s karakter olmalıdır!' }
  before_save :reorganize_title
end
