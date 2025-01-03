require 'rails_helper'

class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
  end
end

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end
  end
end
