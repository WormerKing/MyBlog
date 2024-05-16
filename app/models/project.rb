class Project < ApplicationRecord
    belongs_to :category,validate: true
    has_and_belongs_to_many :tags

    validate :control_dates
    
    validates :title,
        uniqueness: {case_sensitive: false, message: "kısmı daha önceden alınmış!"},
        length: {
            in: 5..20,
            too_short: "kısmı en az %{count} karakter olmalıdır!",
            too_long: "kısmı en fazla %{count} karakter olabilir!"
        }

    validates :header,
        length: {
            in: 50..100,
            too_short: "kısmı en az %{count} karakter olmalıdır!",
            too_long: "kısmı en fazla %{count} karakter olabilir!"
        }

    validates :body,
        length: {
            minimum: 50,
            too_short: "kısmı en az %{count} karakter olmalıdır!"
        }

    validates :url,
        presence: {message: "kısmı boş bırakılamaz!"},
        url: {message: "kısmına geçerli bir url giriniz!"},
        uniqueness: {case_sensitive: false,message:"kısmı daha önce kullanılmış!"}

    validates :start_date, :end_date,presence: {message: "kısmı boş olamaz!"}

    private
    def control_dates
        return if end_date.blank? || start_date.blank?
        if end_date < start_date
            errors.add(:end_date,"kısmı başlangıç tarihinden sonra olmalıdır!")
        end
    end
end
