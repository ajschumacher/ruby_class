#!/usr/bin/env ruby

# ROBOT FACTORY
class Robot
  attr_accessor :x, :y

  def coordinates
    [x, y]
  end

  def state_coordinates
    puts "I AM AT #{coordinates}"
  end

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

# Create a new Robot
robot = Robot.new

# Specify coordinates
robot.x = 3
robot.y = 4

robot.state_coordinates   # prints: I AM AT [3, 4]
robot.navigate_to(4, 4)   # prints: RIGHT
robot.state_coordinates   # prints: I AM AT [4, 4]

robot.navigate_to(-4, 7)   # prints: RIGHT
robot.state_coordinates   # prints: I AM AT [4, 4]
