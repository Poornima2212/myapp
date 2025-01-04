require 'rails_helper'

class StringCalculator
  attr_reader :call_count

    def initialize
      @call_count = 0
    end
  
    def add(numbers)
      @call_count += 1
      return 0 if numbers.empty?
  
      delimiter, numbers = extract_delimiter_and_numbers(numbers)
      nums = parse_numbers(numbers, delimiter)
      validate_no_negatives(nums)
  
      nums.reject { |n| n > 1000 }.sum
    end
  
    private
  
    def extract_delimiter_and_numbers(numbers)
      if numbers.start_with?("//")
        delimiters, numbers = numbers[2..].split("\n", 2)
        custom_delimiters = delimiters.scan(/\[(.*?)\]/).flatten
        delimiter_regex = custom_delimiters.any? ? /#{custom_delimiters.map { |d| Regexp.escape(d) }.join('|')}/ : Regexp.escape(delimiters)
        [delimiter_regex, numbers]
      else
        [/[,\n]/, numbers]
      end
    end
  
    def parse_numbers(numbers, delimiter)
      numbers.split(delimiter).map(&:to_i)
    end
  
    def validate_no_negatives(nums)
      negatives = nums.select(&:negative?)
      raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
    end
end
  
  
  

RSpec.describe StringCalculator do

  let(:calculator) { StringCalculator.new }
  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calculator.add("")).to eq(0)
    end

    it "returns the number itself for a single number" do
        expect(calculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers separated by a comma" do
        expect(calculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers separated by commas" do
        expect(calculator.add("1,2,3,4")).to eq(10)
    end

    it "returns the sum of numbers separated by commas or new lines" do
        expect(calculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters defined at the beginning of the string" do
        expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it "handles delimiters of any length" do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "handles multiple delimiters" do
      expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
    end

    it "ignores numbers greater than 1000" do
      expect(calculator.add("2,1001")).to eq(2)
    end

    it "throws an exception when negative numbers are provided" do
        expect { calculator.add("1,-2,3,-4") }.to raise_error("negative numbers not allowed: -2, -4")
    end
  end

  describe "#call_count" do
    it "returns 0 when no add operation has been performed" do
        expect(calculator.call_count).to eq(0)
    end
    
    it "returns the correct count when add operation has been performed" do
        calculator.add("1,2")
        calculator.add("1,2,3")
        expect(calculator.call_count).to eq(2)
    end
  end
end
