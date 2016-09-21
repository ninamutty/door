require_relative 'spec_helper'
require_relative '../door'

describe 'testing open? method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)}

  it 'must return a boolean if asked whether the door is open or closed' do
    door_opened.open?.must_equal true
    door_closed_locked.open?.must_equal false
  end
end



describe 'testing unlocked? method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)}

  it 'must return a boolean if asked whether the door is locked or unlocked' do
    door_opened.unlocked?.must_equal true
    door_closed_locked.locked?.must_equal false
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
    door_closed_unlocked.open?.must_equal true
  end

  it 'must not change and raise a method error if the door is already open' do
    door_opened.open.must_raise ArgumentError
    door_opened.open?.must_equal true
  end

  it 'must not open and raise a method error if the door is locked' do
    door_closed_locked.open.must_raise ArgumentError
    door_closed_locked.open?.must_equal false
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
    door_opened.open?.must_equal false
  end

  it 'must not change and raise a method error if the door is already closed' do
    door_closed_unlocked.close.must_raise ArgumentError
    door_closed_unlocked.open?.must_equal false
  end
end


describe 'Door class lock instance method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)} #default values for open and unlocked
  let (:door_closed_unlocked) {Door.new(false, true)}

  it 'must be a kind of door instance' do
    door_opened.must_be_kind_of Door
  end

  it 'must lock if the door is unlocked' do
    door_closed_unlocked.lock
    door_closed_unlocked.unlocked?.must_equal false
  end

  it 'must not change and raise a argument error if the door is already locked' do
    door_closed_locked.lock.must_raise ArgumentError
    door_closed_locked.unlocked?.must_equal false
  end
end


describe 'Door class unlock instance method' do
  let (:door_closed_locked) {Door.new}
  let (:door_opened) {Door.new(true, true)} #default values for open and unlocked
  let (:door_closed_unlocked) {Door.new(false, true)}

  it 'must be a kind of door instance' do
    door_opened.must_be_kind_of Door
  end

  it 'must unlock if the door is locked' do
    door_closed_locked.unlock
    door_closed_locked.unlocked?.must_equal true
  end

  it 'must not change and raise a argument error if the door is already locked' do
    door_closed_unlocked.lock.must_raise ArgumentError
    door_closed_unlocked.unlocked?.must_equal true
  end
end
