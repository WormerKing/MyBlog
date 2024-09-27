class Category < ApplicationRecord
	has_many :articles
	has_many :projects

	validates :name,length: {in:2..20,too_short:"kısmı en az %{count} uzunlukta olmalıdır!",too_long:"kısmı en fazla %{count} uzunlukta olabilir!"},
		uniqueness: {case_sensitive: false,message:"kısmı eşsiz olmalıdır!"}

	before_validation :strip_name,only: %w[ name ]
	before_validation define_method(:capitalize_name) {self.name.capitalize!}

	private
	def strip_name
		self.name.strip!
	end
end
