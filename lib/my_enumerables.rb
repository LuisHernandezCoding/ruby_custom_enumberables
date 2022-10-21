# frozen_string_literal: true

# Module for Custom Enumerables
module Enumerable
  # Method to run on each element of the enumerable with an index
  def my_each_with_index
    return to_enum unless block_given? # this is a guard clause to return an enumerator if no block is given

    i = 0 # this is the index
    while i < length # start a while loop to iterate through the array
      yield(self[i], i) # yield the element and the index to the block
      i += 1 # increment the index
    end
    self # return the original array
  end

  # method to select elements that satisfy a condition
  def my_select
    return to_enum unless block_given? # this is a guard clause to return an enumerator if no block is given

    result = [] # create an empty array to store the results
    my_each { |x| result << x if yield(x) } # call my_each on the array and push the element to the result if block true
    result # return the result
  end

  # method to check if all elements in the array satisfy the condition
  def my_all?
    return true unless block_given? # return true if no block is given

    my_each { |x| return false unless yield(x) } # return false if any element returns false
    true # return true if all elements return true
  end

  # method to check if any element in the array satisfies the condition
  def my_any?
    return to_enum unless block_given? # this is a guard clause to return an enumerator if no block is given

    my_each { |x| return true if yield(x) } # call my_each on the array and return true if block true
    false # return false if block false
  end

  # method to check if no element in the array satisfies the condition
  def my_none?
    return true unless block_given? # return true if no block is given

    my_each { |x| return false if yield(x) } # return false if any element returns true
    true # return true if all elements return false
  end

  # method to count the number of elements in the array
  def my_count
    return length unless block_given? # return the length of the array if no block is given

    count = 0 # create a counter variable
    my_each { |x| count += 1 if yield(x) } # call my_each on the array and increment the counter if block true
    count # return the counter
  end

  # method to map the elements in the array
  def my_map
    return to_enum unless block_given? # this is a guard clause to return an enumerator if no block is given

    result = [] # create an empty array to store the results
    my_each { |x| result << yield(x) } # call my_each on the array and push the result of the block to the result array
    result # return the result array
  end

  # method to inject the elements in the array
  def my_inject(*args)
    memmory = args[0] if args[0].is_a?(Integer) # set the initial value to the first argument if it is an integer
    memmory = args[1] if args[1].is_a?(Integer) # set the initial value to the second argument if it is an integer
    memmory = first if memmory.nil? # set initial value to the first element of the array if no initial value is given

    my_each { |x| memmory = yield(memmory, x) } # call my_each on the array and set the memmory to the result
    memmory # return the memmory
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given? # this is a guard clause to check if a block is given

    i = 0 # this is the index
    while i < length # start a while loop to iterate through the array
      yield(self[i]) # yield the element to the block
      i += 1 # increment the index
    end
    self # return the original array
  end
end
