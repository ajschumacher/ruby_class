#!/usr/bin/env ruby

menu = ['Create new entry',
        'View existing entry',
        'Delete existing entry',
        'Quit Application']

parts = [[:first_name, 'First name: '],
         [:last_name, 'Last name: '],
         [:phone_number, 'Phone number: '],
         [:email, 'Email: ']]

addresses = []

def prompt(string)
  print string
  gets.chomp
end

def selectFrom(array)
  loop do
    array.each_with_index do |item, index|
      puts index.to_s + '   ' + item
    end
    response = prompt 'Make your choice: '
    index = Integer(response) rescue -1
    if 0 <= index and index < array.length
      return response.to_i
    end
    puts "You don't know how to read, or something like that."
  end
end

def namesFrom(addresses)
  addresses.map do |address|
    address[:last_name] + ', ' + address[:first_name]
  end
end

def display(address, parts)
  parts.each do |part|
    puts part[1] + address[part[0]]
  end
end

def newAddress(parts)
  puts "You are adding a new entry."
  result = {}
  parts.each do |part|
    result[part[0]] = prompt(part[1])
  end
  result
end

loop do
  puts 'WELCOME TO THE MAIN MENU CHOOSE WISELY'
  case selectFrom(menu)
  when 0
    addresses << newAddress(parts)
  when 1
    if addresses.length < 1
      puts 'No addresses to view!'
      next
    end
    index = selectFrom(namesFrom(addresses))
    display(addresses[index], parts)
  when 2
    if addresses.length < 1
      puts 'No addresses to delete!'
      next
    end
    index = selectFrom(namesFrom(addresses))
    addresses.delete_at(index)
  when 3
    exit
  end
end
