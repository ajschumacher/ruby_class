#!/usr/bin/env ruby

# THING IN PLANE
class PhysicalThing
  attr_accessor :x, :y

  def coordinates
    [x, y]
  end

  def state_coordinates
    puts "I AM AT #{coordinates}"
  end
end

# VERY MAP
class Shovel < PhysicalThing
end

# SO DIG
class Shovel < PhysicalThing
  def dig
    puts 'SCOOP'
  end
end

# ROBOT FACTORY
class Robot < PhysicalThing
  def right
    puts 'RIGHT'
    self.x += 1
  end

  def left
    puts 'LEFT'
    self.x -= 1
  end

  def up
    puts 'UP'
    self.y += 1
  end

  def down
    puts 'DOWN'
    self.y -= 1
  end

  def navigate_to(new_x, new_y)
    until x == new_x && y == new_y
      x < new_x ? right : nil
      new_x < x ? left  : nil
      y < new_y ? up    : nil
      new_y < y ? down  : nil
    end
  end
end

robot = Robot.new()
robot.x = 3
robot.y = 4

shovel = Shovel.new
shovel.x = 5
shovel.y = 6

robot.state_coordinates                # prints: I AM AT [3, 4]
robot.navigate_to(shovel.x, shovel.y)  # prints: RIGHT RIGHT UP UP
robot.state_coordinates                # prints: I AM AT [5, 6]

shovel.dig                             # prints: SCOOP
