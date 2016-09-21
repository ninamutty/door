
class Door
  def initialize(open=false, unlocked=false)
    @open=open
    @unlocked=unlocked
  end

  def open?
    @open
  end

  def unlocked?
    @unlocked
  end

  def open
  end

  def close
  end

  def lock
  end

  def unlock
  end
end
