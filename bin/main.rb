require_relative '../lib/my_enumerables'

def get_valid_input(&block)
  input = gets.chomp
  until block.call(input)
    puts 'Invalid input. Please try again.'
    input = gets.chomp
  end
  input
end

p 'This is a test for my enumerables'
p '-----------------------------'
p 'my_each'
p 'please put your input here, for example [1,2,3,4,5]'
print 'input: '
# check if the input is any valid array
input = get_valid_input { |input| input.match?(/\[.*\]/) }

p '1. print each element'
p input[1..-2].split(',').my_each { |x| p x }
p '2. print each element with index'
p input[1..-2].split(',').my_each_with_index { |x, i| p "value: #{x} index: #{i}" }
p '-----------------------------'
p 'my_all?'
p 'using the same array...'
p input
p '1. check if all elements are integers'
p input[1..-2].split(',').my_all? { |x| x.is_a?(Integer) }
p '2. check if all elements are greater than 3'
p input[1..-2].split(',').my_all? { |x| x.to_i > 3 }
p '3. check if all elements are greater than 3 and less than 5'
p input[1..-2].split(',').my_all? { |x| x.to_i > 3 && x.to_i < 5 }
p '4. check if all elements are strings'
p input[1..-2].split(',').my_all? { |x| x.is_a?(String) }
p '5. check if all elements are strings and have length greater than 3'
p input[1..-2].split(',').my_all? { |x| x.is_a?(String) && x.length > 3 }
p '6. check if all elements are strings and have length greater than 3 and less than 5'
p input[1..-2].split(',').my_all? { |x| x.is_a?(String) && x.length > 3 && x.length < 5 }
p '-----------------------------'
p 'my_any?'
p 'using the same array...'
p '1. check if any element is an integer'
p input[1..-2].split(',').my_any? { |x| x.is_a?(Integer) }
p '2. check if any element is greater than 3'
p input[1..-2].split(',').my_any? { |x| x.to_i > 3 }
p '3. check if any element is greater than 3 and less than 5'
p input[1..-2].split(',').my_any? { |x| x.to_i > 3 && x.to_i < 5 }
p '4. check if any element is a string'
p input[1..-2].split(',').my_any? { |x| x.is_a?(String) }
p '5. check if any element is a string and has length greater than 3'
p input[1..-2].split(',').my_any? { |x| x.is_a?(String) && x.length > 3 }
p '6. check if any element is a string and has length greater than 3 and less than 5'
p input[1..-2].split(',').my_any? { |x| x.is_a?(String) && x.length > 3 && x.length < 5 }
p '-----------------------------'
p 'my_none?'
p 'using the same array...'
p '1. check if none of the elements are integers'
p input[1..-2].split(',').my_none? { |x| x.is_a?(Integer) }
p '2. check if none of the elements are greater than 3'
p input[1..-2].split(',').my_none? { |x| x.to_i > 3 }
p '3. check if none of the elements are greater than 3 and less than 5'
p input[1..-2].split(',').my_none? { |x| x.to_i > 3 && x.to_i < 5 }
p '4. check if none of the elements are strings'
p input[1..-2].split(',').my_none? { |x| x.is_a?(String) }
p '5. check if none of the elements are strings and have length greater than 3'
p input[1..-2].split(',').my_none? { |x| x.is_a?(String) && x.length > 3 }
p '6. check if none of the elements are strings and have length greater than 3 and less than 5'
p input[1..-2].split(',').my_none? { |x| x.is_a?(String) && x.length > 3 && x.length < 5 }
p '-----------------------------'
p 'my_count'
p 'using the same array...'
p '1. count the number of elements'
p input[1..-2].split(',').my_count
p '2. count the number of elements greater than 3'
p input[1..-2].split(',').my_count { |x| x.to_i > 3 }
p '3. count the number of elements greater than 3 and less than 5'
p input[1..-2].split(',').my_count { |x| x.to_i > 3 && x.to_i < 5 }
p '4. count the number of strings'
p input[1..-2].split(',').my_count { |x| x.is_a?(String) }
p '5. count the number of strings with length greater than 3'
p input[1..-2].split(',').my_count { |x| x.is_a?(String) && x.length > 3 }
p '6. count the number of strings with length greater than 3 and less than 5'
p input[1..-2].split(',').my_count { |x| x.is_a?(String) && x.length > 3 && x.length < 5 }
p '-----------------------------'
p 'my_map'
p 'using the same array...'
p '1. map the array with the elements multiplied by 2'
p input[1..-2].split(',').my_map { |x| x.to_i * 2 }
p '2. map the array with the elements multiplied by 2 and added by 1'
p input[1..-2].split(',').my_map { |x| x.to_i * 2 + 1 }
p '3. map the array with the elements multiplied by 2 and added by 1 and then print each element'
input[1..-2].split(',').my_map { |x| p x.to_i * 2 + 1 }
p '-----------------------------'
p 'my_inject'
p 'using the same array...'
p '1. inject the array with the sum of the elements'
p input[1..-2].split(',').my_inject(0) { |sum, x| sum + x.to_i }
p '2. inject the array with the sum of the elements and add 1'
p input[1..-2].split(',').my_inject(1) { |sum, x| sum + x.to_i }
p '3. inject the array with the product of the elements'
p input[1..-2].split(',').my_inject(1) { |product, x| product * x.to_i }
p '4. inject the array with the product of the elements and add 1'
p input[1..-2].split(',').my_inject(1) { |sum, x| sum * x.to_i }
p '-----------------------------'
p 'Finished!'
p '-----------------------------'