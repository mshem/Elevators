
class Floor
	attr_accessor :elevators, :people

	def initialize(i)
		@number=i
		@elevators = Array.new
		@people = Array.new
	end

	def number_of_elevators
		@elevators.length
	end

	def add_elevator(e)
		@elevators.push(e)
	end

	def remove_elevator(e)
		@elevators.delete(e)
	end


	def update
		@elevators.each do |e|
			if e.current_floor != @number
				remove_elevator(e)
			end
		end
	end

	def to_s
		"Floor #{@number} has #{@elevators.length} elevators."
	end
end
