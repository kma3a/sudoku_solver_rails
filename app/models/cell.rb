class Cell

	attr_accessor :value

	def initialize(args)
		@value = args[:value]
	end

	def change_value(input_array)
		if value.is_a?(Array)
			self.value -= input_array
		end
		value
	end

	def check_value
		value.is_a?(Array) && value.length == 1
	end

	def make_value
		if check_value
			self.value = value.first
		end
		value
	end

end
