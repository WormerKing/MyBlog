class Communication < ApplicationRecord
	validate_github_regex = /(http|https):\/\/(github|gitlab)(.+)/

	validates :telephone_number,
		length: {is:10,message: "on karakter olmalıdır!"},
		telephone_number: {country: :tr, types: [:fixed_line, :mobile],message: "Telefon numarası geçerli olmalıdır!"}

	validates :github,presence: {message: "kısmı boş bırakılamaz!"},
		uniqueness: {case_sensitive:false,message:"kısmı eşsiz olmalıdır!"},
		url: {message: "kısmına geçerli bir url giriniz!"},
		format: {with:validate_github_regex,message: "kısmı geçerli bir github ya da gitlab adresi değil!"}

	validates :email,
		presence: {message: "kısmı boş bırakılamaz"},
		email: {message: "kısmı geçerli olmalıdır!"}

end
