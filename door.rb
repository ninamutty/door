
class Door
  #allows you to read the inscription on the door but not change it
  attr_reader :inscription

  #sets deafualts of closed, locked door with and inscription
  def initialize(open=false, unlocked=false, inscription="This a door - Welcome to my door")
    @open = open

    if @open == true
      @unlocked = true
    else
      @unlocked = unlocked
    end

    @inscription = inscription
  end


  ## Tells whether the door is open or not
  def open?
    @open == true ? "The door is open" : "The door is closed"
  end

  ## Tells whether the door is unlocked or not
  def unlocked?
    @unlocked == true ? "The door is unlocked" : "The door is locked"
  end

  ## Opens the door if closed and locked, tells the door is open
  def open
    raise ArgumentError if @open == true || @unlocked == false
    @open = true
    @open == true ? "The door is open" : "The door is closed"
  end

  ## Closes the door if open, tells if the door is closed
  def close
    raise ArgumentError if @open == false
    @open = false
    @open == true ? "The door is open" : "The door is closed"
  end

  ## Locks the door if closed and unlocked, tells the door is locked
  def lock
    raise ArgumentError if @open == true
    raise ArgumentError if @unlocked == false
    @unlocked = false
    @unlocked == true ? "The door is unlocked" : "The door is locked"
  end

  ## Unlocks the door if closed and locked, tells the door is unlocked
  def unlock
    raise ArgumentError if @open == true
    raise ArgumentError if @unlocked == true
    @unlocked = true
    @unlocked == true ? "The door is unlocked" : "The door is locked"
  end
end



#### Tests ###

door = Door.new
puts door.inscription
puts door.open?
puts door.unlocked?
puts door.unlock
puts door.open
puts door.close
puts door.lock

#door.inscription = "I'm making a new inscription"


door2 = Door.new(true, true, "A different inscription")
puts door2.inscription
puts door2.open?
puts door2.unlocked?

door3 = Door.new(true, false, "Shouldn't be open and locked..")
puts door3.inscription
puts door3.open?
puts door3.unlocked? ##Even tho set to false, a door can't be open and locked - so the default of open overrides the default of locked (in initialize)
