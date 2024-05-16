class Article < ApplicationRecord
    belongs_to :category,validate: true
    has_and_belongs_to_many :tags

    validates :title,length: {
        in:5..40,
        too_short:"kısmı en az %{count} uzunlukta olmalıdır!",
        too_long:"kısmı en fazla %{count} uzunlukta olabilir!"
    }, uniqueness: {case_sensitive: false,message:"kısmı eşsiz olmalıdır!"}

    validates :header,
        length:{
            in:10..100,
            too_short:"kısmı en az %{count} karakter olmalıdır!",
            too_long:"kısmı en fazla %{count} karakter uzunluğunda olabilir!"
        }

    validates :body,length: {minimum:50,too_short: "kısmı en az %{count} karakter olmalıdır!"}
end
