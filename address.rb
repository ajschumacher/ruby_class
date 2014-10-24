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

def number_or_neg(string)
  Integer(string)
rescue ArgumentError
  -1
end

def select_from(array)
  loop do
    array.each_with_index do |item, index|
      puts index.to_s + '   ' + item
    end
    response = prompt 'Make your choice: '
    choice = number_or_neg(response)
    return response.to_i if 0 <= choice && choice < array.length
    puts "You don't know how to read, or something like that."
  end
end

def names_from(addresses)
  addresses.map do |address|
    address[:last_name] + ', ' + address[:first_name]
  end
end

def display(address, parts)
  parts.each do |part, description|
    puts description + address[part]
  end
end

def new_address(parts)
  puts 'You are adding a new entry.'
  result = {}
  parts.each do |part, description|
    result[part] = prompt(description)
  end
  result
end

loop do
  puts 'WELCOME TO THE MAIN MENU CHOOSE WISELY'
  case select_from(menu)
  when 0
    addresses << new_address(parts)
  when 1
    if addresses.length < 1
      puts 'No addresses to view!'
      next
    end
    choice = select_from(names_from(addresses))
    display(addresses[choice], parts)
  when 2
    if addresses.length < 1
      puts 'No addresses to delete!'
      next
    end
    choice = select_from(names_from(addresses))
    addresses.delete_at(choice)
  when 3
    exit
  end
end
