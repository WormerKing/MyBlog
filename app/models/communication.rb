class Communication < ApplicationRecord
  validate_github_regex = %r{(http|https)://(github|gitlab)(.+)}
  validate_linkedin_regex = %r{(http|https)://(www\.linkedin|linkedin)(.+)}
  validate_instagram_regex = %r{(http|https)://(www\.instagram|instagram)(.+)}

  validates :telephone_number,
            length: { is: 10, message: 'on karakter olmalıdır!' },
            telephone_number: { country: :tr, types: %i[fixed_line mobile],
                                message: 'Telefon numarası geçerli olmalıdır!' }

  validates :github, presence: { message: 'kısmı boş bırakılamaz!' },
                     uniqueness: { case_sensitive: false, message: 'kısmı eşsiz olmalıdır!' },
                     url: { message: 'kısmına geçerli bir url giriniz!' },
                     format: { with: validate_github_regex, message: 'kısmı geçerli bir github ya da gitlab adresi değil!' }

  validates :email,
            presence: { message: 'kısmı boş bırakılamaz' },
            email: { message: 'kısmı geçerli olmalıdır!' }

  validates :linkedin, presence: { message: 'kısmı boş bırakılamaz!' },
                       uniqueness: { case_sensitive: false, message: 'kısmı eşsiz olmalıdır!' },
                       url: { message: 'kısmına geçerli bir url giriniz!' },
                       format: { with: validate_linkedin_regex, message: 'kısmı geçerli bir linkedin adresi değil!' }

  validates :instagram, presence: { message: 'kısmı boş bırakılamaz!' },
                        uniqueness: { case_sensitive: false, message: 'kısmı eşsiz olmalıdır!' },
                        url: { message: 'kısmına geçerli bir url giriniz!' },
                        format: { with: validate_instagram_regex, message: 'kısmı geçerli bir instagram adresi değil!' }
end
