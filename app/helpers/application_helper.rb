module ApplicationHelper
	def print_error_messages(object,column)
		unless object.errors[column].empty?
			return "<div class=\"invalid-feedback\">#{column.capitalize} #{object.errors[column].join("<br/ >")}</div>".html_safe
		end
	end
end
