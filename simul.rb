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

p=Person.new(0,3)
@people = Array.new
@people.push(p)

@building = Building.new($numfloors, @numelevators, @people)





@building.to_s

@numticks.to_i.times do |t|
	@building.update
	puts @building.to_s
end 

