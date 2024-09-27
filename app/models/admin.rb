class Admin < ApplicationRecord
	has_secure_password
	before_validation :strip_vals
	after_validation :after_validation_method

	validates :firstname, length: {in:3..10,too_short:"kısmı en az %{count} karakter olmalıdır!",
		too_long:"kısmı en fazla %{count} karakter olabilir!"}


	validates :lastname,length: {in:3..20,too_short:"kısmı en az %{count} karakter olmalıdır!",
		too_long:"kısmı en fazla %{count} karakter olabilir!"}

	validates :username,length: {in:5..20,too_short:"kısmı en az %{count} karakter olmalıdır!",
		too_long:"kısmı en fazla %{count} karakter olabilir!"},
		uniqueness: {case_sensitive:false,message:"kısmı eşsiz olmalıdır!"},
		format: {without: / /,message: "kısmı boşluk içeremez!"}

	validates :email,presence: {message:"kısmı boş bırakılamaz"},
		email: {message:"kısmı geçerli bir eposta adresi değil!"},
		uniqueness: {case_sensitive: false,message: "kısmı eşsiz olmalıdır!"}

	validates :password,length: {
			in:5..100,
			too_short:"kısmı en az %{count} karakter olmalıdır!",
			too_long:"kısmı en fazla %{count} karakter olabilir!"
		},:on => :create # ,confirmation: {case_sensitive: false}

	validates :password_confirmation, presence: {message:"kısmı boş olamaz!"},:on => :create

	private
	def strip_vals
		self.firstname.strip! if self.firstname.class == String
		self.lastname.strip! if self.lastname.class == String
		# self.username.strip! if self.username.class == String
		self.email.strip! if self.email.class == String
	end

	def after_validation_method
		#TODO buraya username validation ekleyebilirsin self.username.gsub!(/\W/,"") gibi
		self.username.gsub!(" ","") if self.username.class == String
	end
end