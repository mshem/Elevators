class Elevator
  require './Person.rb'
  require './Floor.rb'


  def initialize(n)
    @number = n
    @ELEV_RESTING_FLOOR=0
    @current_floor=@ELEV_RESTING_FLOOR
    @intended_floors=Array.new
    @intended_floors.push(@current_floor)
    @people = Array.new
  end

  def current_floor
    @current_floor
  end

  def intended_floors
    @intended_floors
  end

  def next_floor
    intended_floors.last
  end

  def set_destination(floor)
    if !(floor.to_i < 0 || floor.to_i > $numfloors.to_i - 1)
    @intended_floors.push(floor)
    end
  end

  def move_up
    @current_floor=@current_floor +1
  end

  def move_down
    @current_floor=@current_floor -1
  end

  def update
    if !available
      move
      drop_off
    end
  end


  def move
      if @current_floor < @intended_floors.last
        move_up
      else 
        if @current_floor > @intended_floors.last
        move_down
        else
          @intended_floors.pop
        end
      end
  end

  def available
    intended_floors.last.nil?
  end

  def pick_up(person)
    if (person.current_floor==@current_floor)
    set_destination(person.intended_floor)
    @people.push(person)
    else
      puts "cant pick up from different floor"
    end
  end

  def drop_off
    p = @people.pop
    if !p.nil?
      if p.intended_floor == @current_floor
        @intended_floors.pop
        return p
      else
       @people.push(p)
      end
    end
    return p
  end

  def to_s
    "Elevator #{@numer} has #{@people.length} people. "
  end
end


