
class Door
  attr_reader :inscription

  def initialize(open=false, unlocked=false, inscription="This a door - Welcome to my door")
    @open = open
    @unlocked = unlocked
    @inscription = inscription
  end

  def open?
    @open
  end

  def unlocked?
    @unlocked
  end

  def open
    raise ArgumentError if @open == true || @unlocked == false
    @open = true
  end

  def close
    raise ArgumentError if @open == false
    @open = false
  end

  def lock
    raise ArgumentError if @unlocked == false
    @unlocked = false
  end

  def unlock
    raise ArgumentError if @unlocked == true
    @unlocked = true
  end
end
