require 'rails_helper'

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    numbers.to_i
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
  end
end
