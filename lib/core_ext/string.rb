class String
  def phone_number
		if self[/0\d[\s\d-]{5,}\d/].present?
			@phone_number ||= self[/0\d[\s\d-]{5,}\d/]
		end
		@phone_number
	end
end