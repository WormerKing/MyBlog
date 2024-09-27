module ApplicationHelper
	def print_error_messages(object,column)
		unless object.errors[column].empty?
			return "<div class=\"invalid-feedback\">#{I18n.t(column.downcase)} #{object.errors[column].join("<br/ >")}</div>".html_safe
		end
	end

	def string_to_url(str)
		str.downcase.gsub(" ","+")
	end
  
	def print_session_error_messages(message)
		return "<div class=\"invalid-feedback fs-5\">#{message}</div>".html_safe
	end
end
