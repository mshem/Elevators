class Elevator
  require './Person.rb'
  require './Floor.rb'


  def initialize
    @ELEV_RESTING_FLOOR=0
    @current_floor=@ELEV_RESTING_FLOOR
    @intended_floor=@current_floor
  end

  def current_floor
    @current_floor
  end

  def intended_floor
    @intended_floor
  end

  def set_destination(floor)
    if !(floor.to_i < 0 || floor.to_i > $numfloors.to_i - 1)
    @intended_floor=floor
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
    end
  end


  def move
      if @current_floor < @intended_floor
        move_up
      else 
        if @current_floor > @intended_floor
        move_down
      end
      end
  end

  def available
    current_floor == intended_floor
  end

end


