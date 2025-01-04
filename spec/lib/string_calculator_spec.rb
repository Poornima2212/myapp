require 'rails_helper'

class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
  
      delimiter, numbers = extract_delimiter_and_numbers(numbers)
      nums = parse_numbers(numbers, delimiter)
      validate_no_negatives(nums)
  
      nums.sum
    end
  
    private
  
    def extract_delimiter_and_numbers(numbers)
      if numbers.start_with?("//")
        custom_delimiter, numbers = numbers[2..].split("\n", 2)
        [Regexp.escape(custom_delimiter), numbers]
      else
        [/\n|,/, numbers]
      end
    end
  
    def parse_numbers(numbers, delimiter)
      numbers.split(/#{delimiter}/).map(&:to_i)
    end
  
    def validate_no_negatives(nums)
      negatives = nums.select(&:negative?)
      raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
    end
end
  
  
  

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
        calculator = StringCalculator.new
        expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers separated by a comma" do
        calculator = StringCalculator.new
        expect(calculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers separated by commas" do
        calculator = StringCalculator.new
        expect(calculator.add("1,2,3,4")).to eq(10)
    end

    it "returns the sum of numbers separated by commas or new lines" do
        calculator = StringCalculator.new
        expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters defined at the beginning of the string" do
        calculator = StringCalculator.new
        expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "throws an exception when negative numbers are provided" do
        calculator = StringCalculator.new
        expect { calculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end
  end
end
