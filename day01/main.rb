#!/usr/bin/env ruby
# frozen_string_literal: true

class Day01
  def initialize
    @input_file = File.join(Dir.pwd, 'input.txt')
    @masses = []
    @fuel = 0
  end

  def solve(calc_additional_fuel)
    parse_input
    calculate_total_fuel(calc_additional_fuel)
    print_output
  end

  def parse_input
    File.readlines(@input_file).each do |mass|
      @masses << mass.strip.to_i
    end
  end

  def calculate_total_fuel(calc_additional_fuel)
    @masses.each do |mass|
      @fuel += calculate_fuel(mass, calc_additional_fuel)
    end
  end

  def calculate_fuel(mass, calc_additional_fuel)
    fuel = (mass / 3.0).floor - 2
    return fuel unless calc_additional_fuel

    additional_fuel = 0
    additional_fuel = calculate_fuel(fuel, true) if fuel.positive?
    fuel += additional_fuel if additional_fuel.positive?
    fuel
  end

  def print_output
    p @fuel
  end
end

puts 'Solving part 1 ...'
Day01.new.solve(false)

puts 'Solving part 2 ...'
Day01.new.solve(true)
