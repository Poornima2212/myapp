require 'rails_helper'

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.split(",").map(&:to_i).sum
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
  end
end
