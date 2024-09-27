class Tag < ApplicationRecord
	has_and_belongs_to_many :articles
	has_and_belongs_to_many :projects

	validates :title,
		uniqueness: {
			case_sensitive: false,
			message: "kısmı daha önceden eklenmiş!"
		},
		length: {
			in:2..20,
			too_short:"kısmı en az %{count} karakter uzunluğunda olmalıdır!",
			too_long:"kısmı en fazla %{count} karakter uzunluğunda olabilir!"
		}

	before_validation :strip_title,only: %w[ title ]
	before_validation :downcase_title, only: %w[ title ]

	private
	def strip_title
		self.title.strip! if self.title.class == String
	end

	def downcase_title
		self.title.downcase!
	end
end
