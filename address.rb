#!/usr/bin/env ruby

menu = ['Create new entry',
        'View existing entry',
        'Delete existing entry',
        'Quit Application']

# Nice!  Field name, plus human-readable label.  The
# Array-of-Arrays is definitely easier to type, but
# I probably would have used an Array-of-Hashes instead:
#
#   [
#     {
#       field: :first_name,
#       label: "First name: "
#     },
#     {
#       field: :last_name,
#       label: "Last name: "
#     },
#   ]
#
# Yeah, it's a lot more typing, but its meaning can be
# deduced fairly easily.  It also makes it easy to add
# new characteristics in the future without having to
# change all of the code that's referencing this data
# (Ex: what if you want to indicate that certain fields
#      are required, or you want to add a validation
#      message?                                       )
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
  # Typically, it's better to let the caller handle an
  # Exception rather than having the method return a
  # "special value" when an error occurs.  Why?  Because
  # Exceptions *must* be handled, whereas "special values"
  # can be ignored accidentally.
  -1
end


# Definitely a very useful method, especially since it can
# be reused for dynamically-sized menus.
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
    # String concatenation can be a little dangerous
    # in Ruby since it only works when you can guarantee
    # that everything is actually a String (and not nil).
    # So, something like this:
    #
    #   "#{address[:last_name]}, #{address[:first_name]}"
    #
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
    # Good catch!
    if addresses.length < 1
      puts 'No addresses to view!'
      next
    end
    choice = select_from(names_from(addresses))
    display(addresses[choice], parts)
  when 2
    # Once again: Good catch!
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
