class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?


    delimiters = [',', '\n']
    

    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      custom_delimiter = parts[0][2..-1]
      numbers = parts[1]
      delimiters << custom_delimiter
    end


    delimiter_pattern = Regexp.union(delimiters)
    num_list = numbers.split(delimiter_pattern)

     total = 0
    negatives = []
    num_list.each do |num|
      unless num.empty?
        number = num.to_i
        negatives << number if number < 0
        total += number
      end
    end

    if negatives.any?
      raise "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    total
  end
end

# Example usage
puts StringCalculator.add("")  # Output: 0
puts StringCalculator.add("1")  # Output: 1
puts StringCalculator.add("1,5")  # Output: 6
puts StringCalculator.add("1\n2,3")  # Output: 6
puts StringCalculator.add("//;\n1;2")  # Output: 3

