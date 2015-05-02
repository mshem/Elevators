class Building
	require './Floor.rb'
	require './Elevator.rb'
	require './Person.rb'

	attr_reader :floors, :elevators
	#elevators store a floor and the people on them
	#people store their current floor and intended floor
	#floors is  value
	def initialize(floors, elevators, people)
		@numfloors = floors
		@numelevators = elevators
		@floors = Array.new
		@elevators = Array.new
		@available_elevators = Array.new
		@floors_left = Array.new
		@people = people

		@numfloors.to_i.times do |f|
			@floors.push(Floor.new(f))
		end

		@numelevators.to_i.times do |e|
			@elevators.push(Elevator.new(e))

		end

		@people.each do |p|
			@floors[p.current_floor].people.push(p)
		end

			update

	end

	def update_elevators

		@elevators.each do |e|
		e.update
		@floors[e.current_floor].add_elevator(e)

		end
	end


	def to_s
		s = "Building has #{@numfloors} floors, #{@people.length} people and #{@numelevators} elevators.\n"
		@floors.reverse.each do |f|
			s = s + f.to_s
		end
		return s
	end

	def move_elevators
		@elevators.each do |e|
			e.move
		end
	end

	def update_floors
		@floors.each do |f|
		f.update
		end

	end

	def call_elevator
		p = @people.last
		floor = p.intended_floor 
		if !@floors[floor].nil?
				find_available_elevators
				e = @available_elevators.pop
				if !e.nil?
				e.pick_up(p)
			end
		end

	end



	def find_available_elevators
		@elevators.each do |e|
			if e.available
				@available_elevators.push(e)
			end
		end
	end

	def update
		update_elevators
		update_floors
	end

end
