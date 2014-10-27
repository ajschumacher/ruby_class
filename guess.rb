#!/usr/bin/env ruby

number = 1 + rand(10)

puts 'I am thinking of a number between 1 and 10.'

5.times do
  print 'GUESS MY NUMBER: '
  guess = Integer(gets.chomp)
  if guess < number
    puts 'Too low!'
  elsif number < guess
    puts 'Too high!'
  else
    puts 'NAILED IT!!!'
    exit
  end
end

puts 'You lose! I win! Womp womp!'
