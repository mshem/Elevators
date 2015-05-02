require './Elevator.rb'
require './Building.rb'
require './Person.rb'


def is_numeric?(obj) 
   obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end
#elev max persons, elev resting floor
$numfloors=""
while !is_numeric? $numfloors
puts "How many floors?"
$numfloors = gets.chomp
end

@numelevators=""
while !is_numeric? @numelevators
puts "How many elevators?"
@numelevators = gets.chomp
end

@numticks=""
while !is_numeric? @numticks
puts "How many ticks?"
@numticks = gets.chomp
end

@building = Building.new($numfloors, @numelevators)





@building.to_s
@building.call_elevator(2) 
@building.call_elevator(0)
@building.call_elevator(1)


6.times do |t|
	@building.update
	@building.to_s
end 

