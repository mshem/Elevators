
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
		if !@elevators.include?(e)
		@elevators.push(e)
		end
	end

	def remove_elevator(e)
		@elevators.delete(e)
	end


	def update
		fill_elevators
		empty_elevators
		@elevators.each do |e|
			if e.current_floor != @number
				remove_elevator(e)
			end
		end
	end

	def empty_elevators
		@elevators.each do |e|
			p = e.drop_off
			if !p.nil?
				@people.push(p)
			end
		end
	end

	def fill_elevators
		@people.each do |p|
			if !p.nil?
				if p.intended_floor != number
					if !@elevators.last.nil?
						@elevators.last.pick_up(p)
						@people.delete(p)
					end
				end
			end
		end
	end

	def number
		@number
	end

	def to_s
		s = "Floor #{@number} has #{@people.length} people and #{@elevators.length} elevators. "
		@elevators.each do |e|
			s = s + e.to_s
		end
		return s + "\n"
	end
end
