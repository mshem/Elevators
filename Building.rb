class Building
	require './Floor.rb'
	require './Elevator.rb'

	attr_reader :floors, :elevators
	#elevators store a floor and the people on them
	#people store their current floor and intended floor
	#floors is  value
	def initialize(floors, elevators)
		@numfloors = floors
		@numelevators = elevators
		@floors = Array.new
		@elevators = Array.new
		@available_elevators = Array.new
		@floors_left = Array.new



		@numfloors.to_i.times do |f|
			@floors.push(Floor.new(f))
		end

		@numelevators.to_i.times do |e|
			@elevators.push(Elevator.new(e))

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
		puts "Building has #{@numfloors} floors and #{@numelevators} elevators."
		@floors.reverse.each do |f|
			puts f.to_s
		end
	end

	def move_elevators
		@elevators.each do |e|
			e.move
		end
	end

	def update_floors
		f = @floors_left.pop
		if !f.nil?
			call_elevator(f.number)
		end
		@floors.each do |f|
		f.update
		end

	end

	def call_elevator(floor)
		if !@floors[floor].nil?
				find_available_elevators
				e = @available_elevators.pop
				if e.nil?
					@floors_left.push(@floors[floor])
				else
				e.set_destination(floor)
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
