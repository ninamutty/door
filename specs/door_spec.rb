require_relative 'spec_helper'
require_relative '../door'

describe 'testing open? method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)}

  it 'must return a boolean if asked whether the door is open or closed' do
    door_opened.open?.must_equal "The door is open"
    door_closed_locked.open?.must_equal "The door is closed"
  end
end



describe 'testing unlocked? method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)}
  let (:door_locked_override) {Door.new(true, false)}

  it 'must return a boolean if asked whether the door is locked or unlocked' do
    door_opened.unlocked?.must_equal "The door is unlocked"
    door_closed_locked.unlocked?.must_equal "The door is locked"
  end

  it 'must return unlocked == true if the door is open - even if door set to false' do
    door_locked_override.unlocked?.must_equal "The door is unlocked"
  end

end



describe 'Door class open instance method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)}
  let (:door_closed_unlocked) {Door.new(false, true)}

  it 'must be a kind of door instance' do
    door_opened.must_be_kind_of Door
  end

  it 'must open if the door is closed and unlocked' do
    door_closed_unlocked.open
    door_closed_unlocked.open?.must_equal "The door is open"
  end

  it 'must not change and raise a method error if the door is already open' do
    expect (proc {door_opened.open}).must_raise ArgumentError
    door_opened.open?.must_equal "The door is open"
  end

  it 'must not open and raise a method error if the door is locked' do
    expect (proc {door_closed_locked.open}).must_raise ArgumentError
    door_closed_locked.open?.must_equal "The door is closed"
  end
end


describe 'Door class close instance method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)} #default values for open and unlocked
  let (:door_closed_unlocked) {Door.new(false, true)}

  it 'must be a kind of door instance' do
    door_opened.must_be_kind_of Door
  end

  it 'must close if the door is open' do
    door_opened.close
    door_opened.open?.must_equal "The door is closed"
  end

  it 'must not change and raise a method error if the door is already closed' do
    expect (proc {door_closed_unlocked.close}).must_raise ArgumentError
    door_closed_unlocked.open?.must_equal "The door is closed"
  end
end


describe 'Door class lock instance method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)} #default values for open and unlocked
  let (:door_closed_unlocked) {Door.new(false, true)}

  it 'must be a kind of door instance' do
    door_opened.must_be_kind_of Door
  end

  it 'must lock if the door is unlocked and closed' do
    door_closed_unlocked.lock
    door_closed_unlocked.unlocked?.must_equal "The door is locked"
  end

  it 'must raise ArgumentError if door is open' do
    expect (proc {door_opened.lock}).must_raise ArgumentError
  end

  it 'must not change and raise a argument error if the door is already locked' do
    expect (proc {door_closed_locked.lock}).must_raise ArgumentError
    door_closed_locked.unlocked?.must_equal "The door is locked"
  end
end


describe 'Door class unlock instance method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)} #default values for open and unlocked
  let (:door_closed_unlocked) {Door.new(false, true)}

  it 'must be a kind of door instance' do
    door_opened.must_be_kind_of Door
  end

  it 'must unlock if the door is locked and closed' do
    door_closed_locked.unlock
    door_closed_locked.unlocked?.must_equal "The door is unlocked"
  end

  it 'must raise ArgumentError if door is open' do
    expect (proc {door_opened.lock}).must_raise ArgumentError
  end

  it 'must not change and raise a argument error if the door is already locked' do
    expect (proc {door_closed_unlocked.unlock}).must_raise ArgumentError
    door_closed_unlocked.unlocked?.must_equal "The door is unlocked"
  end
end


describe 'testing Door read instance method' do
  let (:door) {Door.new}

  it 'must return a string' do
    door.inscription.must_be_kind_of String
  end

  it 'must not be changeable' do
    expect (proc {door.inscription = "this was made from a tree"}).must_raise NoMethodError
  end
end
