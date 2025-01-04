require 'rails_helper'

class StringCalculator
    def add(numbers)
      return 0 if numbers.empty?
  
      if numbers.start_with?("//")
        delimiter, numbers = numbers[2..].split("\n", 2)
        numbers.split(delimiter).map(&:to_i).sum
      else
        numbers.split(/[\n,]/).map(&:to_i).sum
      end
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
  end
end
